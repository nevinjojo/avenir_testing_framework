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
  end

  def reset
    @name = ''
    @date = ''
    @success = ''
    $success_count = 0
    $failure_count = 0
    @temp_id = ''
    reset_form
  end

  def reset_form
    @form = ''
  end

  def wait_for_stale
    begin
      nb = @driver.find_element(:class, 'navbar')
      @wait.until {nb}
      reset_form
    rescue
      # ignored
    end
  end

end