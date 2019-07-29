######################################################################
# Results - Reports results from the test script execution.
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the test script result reporting feature of the framework.
class Results

  # @param [WebDriver] driver - The driver that will be used during the process.
  # @param [File] file_name - Creates a file with the same name as the script.
  def initialize(driver, file_name)
    @driver = driver
    @file = file_name
    # Logger configurations
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG
    @logger.datetime_format = '%d-%m-%Y %H:%M:%S'
    @logger.formatter = proc do |severity, datetime, _progname, msg|
      "\n#{msg}"
    end
    # Writer configurations
    @writer = Logger.new "results/#{@file}"
    @writer.level = Logger::DEBUG
    @writer.formatter = proc do |severity, datetime, _progname, msg|
      "\n#{msg}"
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
  # @param [String] messagex
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
    output = exception.is_a?(Exception) ? format('FAILURE: %s', exception.message.split(/\n/)[0]) : 'FAILURE'
    @writer.error output
    @logger.error output
  end

  # Same as log method, but doesn't have a \n at the front.
  def info(message)
    @logger.formatter = proc do |severity, datetime, _progname, msg|
      "#{msg}"
    end
    @writer.formatter = proc do |severity, datetime, _progname, msg|
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
  # @param [String] message
  def screenshot(message)
    @driver.save_screenshot("screenshots/#{message}.png")
  end

  # Adds an \end tag to the \end of the file
  def end_test
    $results.log("Test Analysis: #{$session.failure_count.to_s}/#{$session.success_count.to_s} test actions failed.")
    $results.log("#### End of Test '#{$session.name}' ####")
  end
end
