######################################################################
# Input - Inspect various inputs on the webpage and use them.
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the input functions in the testing framework.
# Each function in the Inout object is a call to execute a task on a particular type of Input.
# Currently there are textInput, menuInput, checkerInput, select2Input and clearInput used.
# Different functions are required for each type of input element due to the variations in the usage of those elements.
class Input

  # @param [Object] driver - The driver that will be used during the process.
  # @param [Object] params - The parameters that are provided along with the button command.
  def initialize(driver, action, params)
    @driver = driver
    @action = action
    @params = params
  end

  # Fills in the values to a text field with a particular ID.
  # Step 1: Clears the text field before entering anything to avoid incorrect data entry.
  # Step 2: If the value is a date, enter stored date. Otherwise enter value specified in the script.
  # Step 3: Press escape once the text is entered so that the element will be 'unfocused' by the driver.
  def text_input
    begin
      $results.log_action("#{@action}(#{@params[0]})")
      @driver.find_element(:id, $session.form + @params[0]).clear
      # If the parameter is a date, then the stored date value will be inputted
      element = @driver.find_element(:id, $session.form  + @params[0])
      if @params[1] == 'date'
        @params[1] = $session.date
      end
      element.send_keys(@params[1..-1].join(' '))
      element.send_keys :escape # escape from text field being in focus.
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params[0]})", ex)
    end
  end

  def menu_input
    begin
      $results.log_action("#{@action}(#{@params[0]})")
      dropdown_list = @driver.find_element(:id, $session.form + @params[0])
      options = dropdown_list.find_elements(tag_name: 'option')
      options.each {|option| option.click if option.text == @params[1..-1].join(' ')}
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params[0]})", ex)
    end
  end

  def checker_input

  end

  def select2_input

  end

  def clear_input

  end
end