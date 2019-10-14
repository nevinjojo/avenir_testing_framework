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
      element = @driver.find_element(:id, $session.form + @params[0])
      inputs = [] # The inputs that will be entered at the \end
      # If the parameter is a date, then the stored date value will be inputted.
      # You can set_date on the fly as part of this command like this: `textInput elem_id date + 3 ignore-weekends`
      if @params.include? 'date'
        if @params[2] == '+'
          $session.set_date(@params[2..-1])
        elsif @params[2] == '-'
          $session.set_date(@params[2..-1])
        end
        inputs.push($session.date)
      end

      # If the parameter has time as a factor, then set the time
      if @params.include? 'time'
        if !@params[@params.index('time') + 1].nil?
          $session.set_time(@params[@params.index('time') + 1])
        else
          $session.set_time
        end
        inputs.push($session.time)
      end
      if !@params.include? 'time' and !@params.include? 'date'
        inputs.push(@params[1..-1])
      end
      element.send_keys(inputs.join(' '))
      element.send_keys :escape # escape from text field being in focus.
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params[0]})", ex)
    end
  end

  # Finds the item in a menu field and clicks on it, based on the id of the menuInput.
  # Step 1: Find the element using the id provided in the script
  # Step 2: Go through each option in the list and finds the option provided in the script
  # Step 3: Clicks on the chosen option.
  # If option not found, do nothing (this will avoid interruption of the test).
  def menu_input
    begin
      $results.log_action("#{@action}(#{@params[0]})")
      dropdown_list = @driver.find_element(:id, $session.form + @params[0])
      options = dropdown_list.find_elements(tag_name: 'option')
      options.each { |option| option.click if option.text == @params[1..-1].join(' ') }
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params[0]})", ex)
    end
  end

  # Finds and clicks on the checker field on the page to check/uncheck an item, based on its id.
  # If option not found, do nothing (this will avoid interruption of the test).
  def checker_input
    begin
      $results.log_action("#{@action}(#{@params[0]})")
      @driver.find_element(:id, $session.form + @params[0]).click
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params[0]})", ex)
    end
  end

  # Input value to field, find the appropriate result and click on a particular select2 field we are looking for.
  #
  # Step 1a: Find the select2Input that ends with the keyword container.
  # Step 1b: Fallback strategy - Otherwise find the select2Input that ends with the keyword result.
  # Step 2: Input text to select2 text field.
  # Step 3: Once the drop down menu of select2 lists all of the potential results, click on highlighted select2Input.
  def select2_input
    begin
      $results.log_action("#{@action}(#{@params[0]})")
      # Find the select2Input element
      if @driver.find_element(:id, 'select2-' + $session.form + @params[0] + '-container').find_element(:xpath, '..').displayed?
        begin
          @driver.find_element(:id, 'select2-' + $session.form + @params[0] + '-container').find_element(:xpath, '..').click
        rescue
          # Do nothing. Try fallback option
        end
      else
        @driver.find_element(:id, 'select2-' + $session.form + @params[0] + '-results').click
      end
      # Input text to select2Input
      @driver.find_element(:class, 'select2-search__field').send_keys(@params[1..-1].join(' '))
      sleep 1 # This sleep is required for the server to return inputs to be selected
      #$session.wait_until(@driver.find_elements(:class, 'select2-results__option--highlighted').size == 1)
      t = @driver.find_elements(:class, 'select2-results__option')
      t[0].click
      $results.success
    rescue => ex
      @driver.switch_to.active_element.send_keys(:escape)
      $session.success = false
      $results.fail("#{@action}(#{@params[0]})", ex)
    end
  end

  # Finds an Input element and clears its content.
  def clear_input
    begin
      $results.log_action("#{@action}(#{@params[0]})")
      @driver.find_element(:id, $session.form + @params[0]).clear
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params[0]})", ex)
    end
  end
end