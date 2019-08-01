######################################################################
# Search - The search field for the table values.
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the search element in the system to search for values in the table.
class Search

  # @param [Object] driver - The driver that will be used during the process.
  # @param [Object] params - The parameters that are provided along with the button command.
  def initialize(driver, action, params)
    @driver = driver
    @action = action
    @params = params
  end

  def execute
    begin
      keyword = @params[1..-1].join(' ')

      # /if the searching element is the saved id. then replace the keyword with the saved id
      if @params[1] == 'saveID'
        keyword = $session.temp_id
      end

      $results.log_action("#{@action} (#{keyword})")
      element = @driver.find_element(:id, @params[0])

      if element.tag_name == 'input' #str[0] == 's_short' or str[0] == 's_part'
        element.send_keys(keyword)
      elsif element.tag_name == 'select' #str[0] == 's_cat' or str[0] == 's_stat' or str[0] == 's_time'
        options = element.find_elements(tag_name: 'option')
        options.each {|option| option.click if option.text.include? keyword}
      end
      $results.success
    rescue => ex
      $results.fail("#{@action}", ex)
    end
  end


end
