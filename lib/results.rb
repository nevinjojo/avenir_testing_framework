######################################################################
# Results - Reports results from the test script execution.
# Author: Nevin Jojo
######################################################################

require 'logger'
require 'fileutils'

# Handles the test script result reporting feature of the framework.
class Results
  attr_accessor :results_dir, :results_sub_dir

  # @param [WebDriver] driver - The driver that will be used during the process.
  # @param [File] file_name - Creates a file with the same name as the script.
  def initialize(driver, result_dir, file_name)
    @driver = driver
    @results_dir = result_dir
    @results_sub_dir = mkdir
    @file = file_name
    # Logger configurations
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG
    @logger.datetime_format = '%d-%m-%Y %H:%M:%S'
    @logger.formatter = proc do |severity, datetime, _progname, msg|
      "\n#{msg}"
    end
    # Writer configurations
    @writer = Logger.new "#{@results_dir}#{@results_sub_dir}/#{@file}"
    @writer.level = Logger::DEBUG
    @writer.formatter = proc do |severity, datetime, _progname, msg|
      "\n#{msg}"
    end
  end

  # Creates a new directory within the results directory with a timestamp as name (if it already doesn't exist).
  # All results files will be stored in this new directory.
  def mkdir
    begin
      dir = "test_results_#{Time.now.strftime('%Y-%m-%d')}"
      FileUtils.mkdir_p("#{@results_dir}/#{dir}")
      # Dir.mkdir("#{@results_dir}/#{dir}")
      return dir
    rescue => ex
      puts ex
    end
  end

  # Sets the writer and logger objects to have a formatter that includes \n in the beginning of the line.
  def format_to_new_ine
    @writer.formatter = proc do |severity, datetime, _progname, msg|
      "\n#{msg}"
    end
    @logger.formatter = proc do |severity, datetime, _progname, msg|
      "\n#{msg}"
    end
  end

  # `log_action` performs the same function as `log` but adds a `:` at the \end.
  # @param [String] message
  def log_action(message)
    log(message + ':')
  end

  # Writes to the file and prints on the console.
  # The log will be printed on a new line (unlike append method).
  # @param [String] message
  def log(message)
    format_to_new_ine
    @logger.info message
    @writer.info message
  end

  # Appends to the \end of the file and console.
  # @param [String] message
  def append(message)
    @logger.formatter = proc do |severity, datetime, _progname, msg|
      " #{msg}"
    end
    @writer.formatter = proc do |severity, datetime, _progname, msg|
      " #{msg}"
    end
    @logger.info message
    @writer.info message
  end

  # Only writes to a file.
  # @param [String] message
  def write(message)
    @logger.info message
  end

  # Only prints to the console.
  # @param [String] message
  def print(message)
    @logger.info message
  end

  # Prints success to the \end of the log.
  def success
    @logger.formatter = proc do |severity, datetime, _progname, msg|
      " #{msg}"
    end
    @writer.formatter = proc do |severity, datetime, _progname, msg|
      " #{msg}"
    end
    @logger.info 'SUCCESS'
    @writer.info 'SUCCESS'
  end

  # Prints failure to the \end of the log.
  def failure(exception = nil)
    @logger.formatter = proc do |severity, datetime, _progname, msg|
      " #{msg}"
    end
    @writer.formatter = proc do |severity, datetime, _progname, msg|
      " #{msg}"
    end
    output = exception.is_a?(Exception) ? format('FAILURE: "%s" %s : line %s', exception.message.split(/\n/)[0], exception.backtrace[0].split(":").last, exception.backtrace[0].split(":")[-2]) : 'FAILURE'
    @writer.error output
    @logger.error output
  end

  # Same as log method, but doesn't have a \n at the front.
  def info(message)
    @logger.formatter = proc do |_severity, _datetime, _progname, msg|
      "#{msg}"
    end
    @writer.formatter = proc do |_severity, _datetime, _progname, msg|
      "#{msg}"
    end
    @logger.info message
    @writer.info message
  end

  # Increment failure count, take screenshot and report failure
  def fail(action, exception = nil)
    $session.failure_count += 1
    screenshot(action)
    $results.failure(exception)
  end

  # Takes the screenshot of the webpage at time of calling the function.
  # @param [String] params - configuration of the screenshot
  def screenshot(params)
    begin
      filepath = "screenshots/#{params[0]}.png"
      if params[-1] == "time" or params[-2] == "time"
        filepath = "screenshots/#{params[0..-2].join(' ')}_#{DateTime.now.strftime("%d-%m-%Y_%H.%M")}.png"
      end
      if params[-1] == "full" or params[-2] == "full"
        $results.log_action(params.join(' '))
        @driver.execute_script("document.getElementsByTagName('html')[0].style['zoom'] = 0.7")
        sleep 3
        @driver.save_screenshot(filepath)
        @driver.execute_script("document.getElementsByTagName('html')[0].style['zoom'] = 1")
        $results.success
      else
        @driver.save_screenshot(filepath)
      end
    rescue => ex
      $results.fail(message, ex)
    end
  end

  # Finds element looking for and screenshot it
  # Note: This is an action that was specifically made for handling the screenshot project.
  #       The command might not function as expected in other projects due to the nature of the calls that
  #       are made within this function.
  def find_and_screenshot(params)
    begin
      $results.log_action("findAndScreenshot(#{params.join(' ')}")
      links = @driver.find_elements(:xpath, '//*[@id="accordion"]/div')
      (0..links.length - 1).each do |i|
        # Navigate to the Kaihu url and fetch the h4 string in the page.
        @driver.navigate.to($config['kaihu'])
        h4 = @driver.find_element(:xpath, "//*[@id='heading#{i}']/h4/a").text
        h4 = h4.split
        h4 = h4[0]

        if h4.include? '/'
          puts h4 + ' - '
          # Navigate to the new url using the h4 fetched before and take a screenshot
          @driver.navigate.to($config['testreg'])
          $login.login($config['testreg_user1'], $config['testreg_pass1'])
          new_link = 'http://irene.avenir.tech/en_GB' + h4
          @driver.navigate.to(new_link)
          @driver.save_screenshot("screenshots/" + "irene_" + h4.delete("/") + ".png")
        end
      end
      $results.success
    rescue => ex
      $results.fail('findAndScreenshot', ex)
    end
  end

  # Adds an \end tag to the \end of the file
  def end_test
    $results.log("Test Analysis: #{$session.failure_count}/#{$session.action_count} test actions failed.")
    $results.log("#### End of Test '#{$session.name}' ####\n")
  end

  # Returns the subdirectory where the results will be stored.
  def get_current_results_dir
    Dir.glob("#{$results.results_dir}#{$results.results_sub_dir}/**/*.txt")
  end
end
