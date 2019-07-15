######################################################################
# Avenir Technology User Interface Testing
#
# Version: 2.0
# Author: Nevin Jojo
# Last Updated: July 15, 2019
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
$time = Time.now
driver = args.get_driver # Browser instantiation
files = args.get_files # File(s) instantiation
$login = Login.new(driver) # Login functions of the system
$session = Session.new(driver) # Session details
$config = YAML.load_file("system_details.yml") # Configuration of environment details

# Initialise a runner with the necessary arguments. Runner executes the scripts
runner = Runner.new(driver, args, $time, files, $login, $session, $config)

# Runs all of the scripts specified in the arg
runner.execute
