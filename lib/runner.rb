#############################################################################
# Runner - starts up the server for testing
# Author: Nevin Jojo
#############################################################################

# Required Gems
require 'selenium-webdriver'
require 'yaml'
require 'date'

# Required Relative Classes
require_relative 'args'
require_relative 'login'
require_relative 'results'
require_relative 'session'

class Runner

  def initialize(driver, args, time, files, login, session, config)
    @driver = driver
    @args = args
    @time = time
    @files = files
    @login = login
    @session = session
    @config = config
  end

  # Main method that triggers the framework to run every script specified by the user.
  def execute
    execute_files
  end

  def execute_files
    @files.each {|filename|
      if File.exist?(filename)
        puts filename
        run_script(filename)
      end
    }
  end

  # Reads each line in the test script and parse the command along with the parameters.
  # @param [String] filename
  def run_script(filename)
    File.open(filename, 'r').each_line do |line|
      line.chomp!
      puts line
      @session.reset
      action = get_action(line)
      params = get_params(line)
      parse_command(action, params)
    end
  end

  #
  # @param [String] action - the action specified in the script
  # @param [String] params - parameters that follows each action in the script
  def parse_command(action, params)

  end

  # Returns the action that is specified in each line of the script.
  def get_action(line)
    line.split.first
  end

  # Returns the parameter that comes after each action line in the script.
  def get_params(line)
    if line.include? '"'
      # Some kinda regex magic is happening here.
      str = line.split(/"([^\\"]+(?:\\.[^\\"]*)*)"|([^\s"]+)/)
      str -= [' ']
      str.shift(1)
      str.shift(1)
    else
      str = line.split(' ')[1..-1]
    end
    str
  end

end