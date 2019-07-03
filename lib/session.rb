#############################################################################
# Session - Keeps track of a test run or session of the framework
# Author: Nevin Jojo
#############################################################################

# Handles the sessions and the values required for each session
class Session

  # @param [WebDriver] driver - the driver that will be used in a particular thread.
  def initialize(driver)
    @driver = driver
    @name = ''
    @date = ''
    @form = ''
    @success = ''
    $success_count = 0
    $failure_count = 0
    @temp_id = ''
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  end

  # Resets the parameter to start a new session for a new test environment.
  def reset
    @name = ''
    @date = ''
    @success = ''
    $success_count = 0
    $failure_count = 0
    @temp_id = ''
    reset_form
  end

  # Resets the form values stored as part of the test environment.
  def reset_form
    @form = ''
  end

  # Waits for the navbar to be displayed before further actions are made.
  def wait_for_stale
    begin
      nb = @driver.find_element(:class, 'navbar')
      @wait.until {nb}
      reset_form
    rescue
      # ignored
    end
  end

  # Adds a regular wait to the session of the size `count`.
  def sleep(count)
    sleep count.join.to_i
  end

  # Waits /until the condition is true.
  def wait_until(condition)
    @wait.until {condition}
  end

end