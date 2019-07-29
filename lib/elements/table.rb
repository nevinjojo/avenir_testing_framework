######################################################################
# Table - Inspect table elements and its sub-elements.
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the table element testing functions.
class Table

  # @param [Object] driver - The driver that will be used during the process.
  # @param [Object] params - The parameters that are provided along with the button command.
  def initialize(driver, params)
    @driver = driver
    @params = params
  end

  # Returns a true /if a button with a particular id is displayed, and vice-versa.
  def content_displayed?
    begin
      if @driver.find_element(:xpath, '//*[@id="data"]/tbody/tr/td[3]').displayed?
        true
      end
    rescue
      false
    end
  end


end