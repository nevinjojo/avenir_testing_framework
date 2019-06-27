######################################################################
# Avenir Technology User Interface Testing
#
# Version: 2.0
# Author: Nevin Jojo
# Last Updated: June 27, 2019
######################################################################

# Required Gems
require 'selenium-webdriver'
require 'yaml'
require 'date'

# Required Relative Classes
require_relative 'lib/args'
require_relative 'lib/login'
require_relative 'lib/results'
require_relative 'lib/session'
require_relative 'lib/runner'

# Required Objects and variables
args = Args.new # Arguments provided by the user
time = Time.now
driver = args.get_driver # Browser instantiation
files = args.get_files # File(s) instantiation
login = Login.new(driver) # Login functions of the system
$results = Results.new(driver, "#{files.to_s.gsub('/', '.')}_#{time.strftime('%Y-%m-%d %H.%M.%S')}.txt") # Logger
session = Session.new(driver) # Session details
config = YAML.load_file("system_details.yml") # Configuration of environment details

# Initialise a runner with the necessary arguments. Runner executes the scripts
runner = Runner.new(driver, args, time, files, login, session, config)

# Runs all of the scripts specified in the arg
runner.execute

# $results.log('log message')
# $results.append('append message')
# $results.write('file only message')
# $results.print('console only message')
# $results.success
# $results.failure
# $results.failure(Exception)
# $results.screenshot('test')
# parse_files
