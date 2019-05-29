######################################################################
# Avenir Technology User Interface Testing
#
# Version: 2.0
# Author: Nevin Jojo
# Last Updated: May 29th, 2019
######################################################################

# Required Gems
require 'selenium-webdriver'
require 'yaml'
require 'date'

# Required Relative Classes
require_relative 'lib/args'

# Required Objects and variables
args = Args.new # Arguments provided by the user
time = Time.now
driver = args.get_driver # Browser Instantiation
files = args.get_files # File(s) Instantiation
login = Login.new(driver)
