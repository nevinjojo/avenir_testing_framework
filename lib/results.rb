######################################################################
# Results - Reports results from the test script execution.
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the test script result reporting feature of the framework.
class Results
  # @param [WebDriver] driver - The driver that will be used during the process.
  # @param [File] file_name - Creates a file with the same name as the script
  #                           along with a timestamp.
  def initialize(driver, file_name)
    @driver = driver
    @file = file_name
  end

  # Prints to the console.
  # The logger provides: date, log level, and message.
  # @return [Logger] @logger
  def log
    if @logger.nil?
      @logger = Logger.new STDOUT
      @logger.level = Logger::DEBUG
      @logger.formatter = proc do |severity, datetime, msg|
        date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
        "[#{date_format}] #{severity}: #{msg}\n"
      end
    end
    @logger
  end

  # Prints just the message to the console and file.
  # The logger provides: Message in the given format.
  # @return [Logger] @logger
  def print
    if @logger.nil?
      @logger = Logger.new STDOUT
      @logger.level = Logger::DEBUG
      @logger.formatter = proc do |msg|
        "#{msg}\n"
      end
    end
    @logger
  end

  # Writes to a file with a given filename.
  # The writer provides: date, log level, and message.
  # @return [Logger] @writer
  def write
    if @writer.nil?
      @writer = Logger.new "results/#{@file}"
      @writer.level = Logger::DEBUG
      @writer.formatter = proc do |severity, datetime, msg|
        date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
        "[#{date_format}] #{severity}: #{msg}\n"
      end
    end
    @writer
  end
  #
  # # Prints a
  # # @param [Object] mes
  # def info(mes)
  #   @file.write("\n" + mes)
  #   puts mes
  # end
  #
  # def comment(mes)
  #   @file.write(mes)
  # end
  #
  # #reports a message to the results text file
  #
  # def message(mes)
  #   @file.write("\n" + mes + ": ")
  #   print mes + ": "
  # end
  #
  # #reports if a test is successful
  # def success
  #   @file.write("SUCCESS")
  #   puts "SUCCESS"
  # end
  #
  # #reports if the test failed
  # def failure(exception = nil)
  #   outp = exception.is_a?(Exception) ? sprintf("FAILURE: %s", exception.message.split(/\n/)[0]) : "FAILURE";
  #   @file.write(outp)
  #   puts outp
  # end
  #
  # #takes a screenshot of the webpage if the test failed
  # def take_screenshot(error_message)
  #   @driver.save_screenshot("screenshots/" + "Error: " + error_message + ".png")
  # end
end
