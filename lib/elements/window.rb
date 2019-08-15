######################################################################
# Window - Handles the window functionality of the framework.
# Author: Nevin Jojo
######################################################################

require 'logger'

class Window

  # @param [Object] driver - The driver that will be used during the process.
  def initialize(driver)
    @driver = driver
  end

  # Switch between windows during a test.
  # The number that is used to switch between windows are in the same order the window is generated.
  def switch_to(params)
    begin
      if params[0].match(/\A-?\d+\Z/)
        $results.log_action("window change - #{params[0]}")
        all_windows = @driver.window_handles
        # Use all_windows to switch to another window
        @driver.switch_to.window(all_windows[params[0].to_i - 1])
        $results.success
      elsif params[0] == 'new'
        @driver.execute_script("window.open()") # Opens a new Window
        @driver.switch_to.window(@driver.window_handles.last) # Use the newest window
      end
    rescue => ex
      $results.fail('window change', ex)
    end
  end
end
