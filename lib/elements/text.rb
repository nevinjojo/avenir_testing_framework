######################################################################
# Text - Inspect text elements and its values
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the text elements om web pages.
class Text

  # @param [Object] driver - The driver that will be used during the process.
  # @param [Object] params - The parameters that are provided along with the button command.
  def initialize(driver, params)
    @driver = driver
    @params = params
  end

  def displayed?(params)
    begin
      text = params[1..-1].join(' ')
      if @driver.page_source.include? text.split.map(&:capitalize).join(' ')
        return true
      elsif @driver.page_source.include? text.upcase
        return true
      else
        return false
      end
    rescue
      return false
    end
  end
end