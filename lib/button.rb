######################################################################
# Button - Inspect buttons on the webpage and clicks on the buttons
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the button functions in the testing framework
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
      $results.log_action(@params[0..-1].join(' '))
      if @params[1].nil?
        @driver.find_element(:link_text, 'New').click
      else
        buttons = driver.find_elements(:class, 'caret')
        buttons[2].click
        @driver.find_element(:link_text, @params[1].capitalize).click
      end
      $session.wait_for_stale
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params.join(' ')})", ex)
    end
  end

  # Finds and clicks on the cancel button present on the webpage.
  def cancel
    begin
      $results.log_action(@params[0])
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
      $results.fail("#{@action}(#{@params[0]}", ex)
    end
  end

  # Click on the new user button based on the `user` id keyword.
  def new_user
    begin
      $results.log_action(@params[0])
      @driver.find_element(:id, "user-new-btn").click
      sleep 2
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params[0]}", ex)
    end
  end

  def download

  end

  def order

  end

  def custom

  end
end