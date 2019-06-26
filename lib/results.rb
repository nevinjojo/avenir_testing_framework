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

  # Writes to the file and prints on the console.
  # @param [String] message
  def log(message)
    @logger.info message
    @writer.info message
  end

  # Appends to the \end of the file/ console line.
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

  # Prints success to the \end of the log.
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

  # Takes the screenshot of the webpage at time of calling the function.
  # @param [String] message
  def screenshot(message)
    @driver.save_screenshot("screenshots/#{message}.png")
  end

end
