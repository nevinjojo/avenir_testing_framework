#Avenir Testing 
#Home page class
#

#following is the requirement for testing
require_relative 'page'

#Home class inherits the qualities of the page class
class Home < Page
    def initialize(driver)
        @driver = driver
    end
end