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
require_relative 'command'

class Runner

  def initialize(driver, args, time, files, results_dir, login, session, config)
    @driver = driver
    @args = args
    @time = time
    @files = files
    @results_dir = results_dir
    @login = login
    @session = session
    @config = config
  end

  # Main method that triggers the framework to run every script specified by the user.
  # Once the runner completes its functions, it will also terminate the WebDriver.
  def execute
    execute_files
    $session.terminate
    get_test_stats
  end

  # Execute test script file(s) in the files array.
  # A new results file with the same name is created (with a timestamp at the \end).
  def execute_files
    @files.each {|filename|
      if File.exist?(filename)
        $results = Results.new(@driver, @results_dir, filename.gsub('/', '.') + "_" + @time.strftime('%Y-%m-%d_%H.%M.%S') + ".txt")
        $results.log(filename)
        run_script(filename)
        $results.end_test
      end
    }
  end

  # Reads each line in the test script and parse the command along with the parameters.
  # @param [String] filename
  def run_script(filename)
    File.open(filename, 'r').each_line do |line|
      line.chomp!
      @session = Session.new(@driver)
      action = get_action(line)
      params = get_params(line)
      parse_command(action, params)
    end
  end

  # Creates a Command object and execute the command based on the actions and parameters.
  # @param [String] action - the action specified in the script
  # @param [String] params - parameters that follows each action in the script
  def parse_command(action, params)
    command = Command.new(@driver, @results_dir, action, params)
    command.execute
    $session.action_count += 1
  end

  # Returns the action that is specified in each line of the script.
  def get_action(line)
    line.split.first
  end

  # Returns the parameter that comes after each action line in the script.
  def get_params(line)
    if line.include? '"'
      # Some kinda regex magic is happening here - courtesy: Mark Newbery
      str = line.split(/"([^\\"]+(?:\\.[^\\"]*)*)"|([^\s"]+)/)
      str -= [' ']
      str.shift(1)
      str.shift(1)
    else
      str = line.split(' ')[1..-1]
    end
    str
  end

  # Generate stats from the Results file that is created by the framework.
  def get_test_stats
    stats = Stats.new(@results_dir)
    # TODO Add test stats feature
  end

end