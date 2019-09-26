######################################################################
# Button - Inspect buttons on the webpage and clicks on the buttons
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the button functions in the testing framework.
# Each function in the Button object is a call to click on the appropriate buttons present on the webpage.
# Different functions are required due to the ids of the buttons or based on whether further steps (such as clicking on
# a dropdown is necessary) are required by the system.
class Button

  # @param [Object] driver - The driver that will be used during the process.
  # @param [Object] params - The parameters that are provided along with the button command.
  def initialize(driver, params)
    @driver = driver
    @params = params
  end

  # Clicks on a general New button or a specific New button allocated to an object on the webpage.
  def new_button
    begin
      $results.log_action("button(#{@params[0..-1].join(' ')})")
      if @params[1].nil?
        @driver.find_element(:link_text, 'New').click
      else
        # If the New Button has multiple options, choose the right one from the dropdown menu.
        buttons = @driver.find_elements(:class, 'caret')
        buttons[2].click
        @driver.find_element(:link_text, @params[1].capitalize).click
      end
      $session.wait_for_stale
      $results.success
    rescue => ex
      $results.fail("button(#{@params.join(' ')})", ex)
    end
  end

  # Finds and clicks on the cancel button present on the webpage.
  def cancel
    begin
      $results.log_action("button(#{@params[0]})")
      # Cancel button can be either a link or an actual button object
      begin
        if @driver.find_element(:id, "lnk-cancel").displayed?
          @driver.find_element(:id, "lnk-cancel").click
          $results.success
        end
      rescue
        if @driver.find_element(:id, "btn-cancel").displayed?
          @driver.find_element(:id, "btn-cancel").click
          $results.success
        end
      end
    rescue => ex
      $results.fail("button(#{@params[0..-1].join(' ')})", ex)
    end
  end

  # Clicks on the new user button.
  # This function is required since the new user buttons have the 'user' keyword in front of it.
  def new_user
    begin
      $results.log_action("button(#{@params[0]})")
      @driver.find_element(:id, "user-new-btn").click
      sleep 2
      $results.success
    rescue => ex
      $results.fail("button(#{@params[0]})", ex)
    end
  end

  # Clicks 0n the download button present on the webpage.
  def download
    begin
      $results.log_action("button(#{@params[0]})")
      @driver.find_element(:partial_link_text, "Download").click
      $results.success
    rescue => ex
      $results.fail("button(#{@params[0]})", ex)
    end
  end

  # Clicks on the order button present on the webpage.
  # The order button has Bid or Ask options. Based on the parameter provided in the script, click on the right button.
  def order
    begin
      $results.log_action("button(#{@params[0]})")
      dropdown = @driver.find_elements(:css, ".btn.btn-link.dropdown-toggle")
      dropdown[@params[1].to_i - 1].click
      sleep 1
      if @params[2].capitalize == 'Bid'
        @driver.find_element(:xpath, "//*[@id='header-TEEQ']/td[#{@params[1].to_i - 1}]/ul/li[1]/button").click
      elsif @params[2].capitalize == 'Ask'
        @driver.find_element(:xpath, "//*[@id='header-TEEQ']/td[#{@params[1].to_i - 1}]/ul/li[2]/button").click
      end
      $results.success
    rescue => ex
      $results.fail("button(#{@params[0]})", ex)
    end
  end

  # Clicks on a custom button with a custom id that begins with `btn-`.
  # If the button with the id provided cannot be found, the command returns failure.
  def custom
    begin
      $results.log_action("button(#{@params[0]})")
      if @driver.find_element(:id, "btn-" + @params[0]).displayed?
        @driver.find_element(:id, "btn-" + @params[0]).click
        $results.success
      else
        $results.fail("button(#{@params[0]})")
      end
    rescue NoMethodError => ex
      puts "\nAn error of type #{ex.class} happened in #{@params[0]}.\n"
    rescue Exception => ex
      puts "\nAn error of type #{ex.class} happened in #{@params[0]}.\n"
      $results.fail("button(#{@params[0]})", ex)
    end
  end

  # Returns a true /if a button with a particular id is displayed, and vice-versa.
  # @param [Object] id - id of the button element searched for
  def displayed?(id)
    begin
      $session.wait_until(@driver.find_element(:id, "btn-" + id).displayed?)
      if @driver.find_element(:id, "btn-" + id).displayed?
        true
      end
    rescue
      false
    end
  end
end