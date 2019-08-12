#############################################################################
# Session - Keeps track of a test run or session of the framework
# Author: Nevin Jojo
#############################################################################

# Handles the sessions and the values required for each session
class Session
  attr_accessor :failure_count, :action_count, :form, :date, :success, :name, :temp_id

  # @param [WebDriver] driver - the driver that will be used in a particular thread.
  def initialize(driver)
    @driver = driver
    @name = ''
    @date = ''
    @form = ''
    @success = ''
    @temp_id = ''
    @failure_count = 0
    @action_count = 0
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  end

  # Resets the parameter to start a new session for a new test environment.
  def reset
    @name = ''
    @date = ''
    @success = ''
    @temp_id = ''
    @failure_count = 0
    @action_count = 0
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
      @wait.until { nb }
      reset_form
    rescue
      # ignored
    end
  end

  # Adds a regular wait to the test session of the size `count`.
  # Note: Do not use the sleep function \unless required since it could slow down the tests and cause unnecessary failures.
  def sleep_for(count)
    sleep count
  end

  # Waits /until the condition is true.
  def wait_until(condition)
    @wait.until { condition }
  end

  # Waits /until the server responses with the table data once a page is loaded.
  def table_wait
    begin
      $results.log_action('tableWait')
      data_processing = @driver.find_element(:id, 'data_processing')
      unless data_processing.displayed?
        $session.wait_until(data_processing.displayed?)
      end
      $session.wait_until(!data_processing.displayed?)
    rescue => ex
      $session.success = false
      $results.fail('tableWait', ex)
    end
  end

  # Terminates the session by quitting the webdriver.
  def terminate
    @driver.quit
  end

  def set_date(params)
    begin
      $results.log_action('date')
      if @driver.find_element(:xpath, '/html/body/div[1]/div[4]/div[1]/div/p').displayed?
        date_text = @driver.find_element(:xpath, '/html/body/div[1]/div[4]/div[1]/div/p').text
        date = Date.parse(date_text)
      end
      begin
        if params[0] == '+'
          date += params[1].to_i
        elsif params[0] == '-'
          date -= params[1].to_i
        end
        @date = date.strftime('%d/%m/%y')
        puts @date
      rescue => ex
        $results.fail("date #{params.join(' ')}", ex)
      end
    rescue => ex
      $results.fail("date #{params.join(' ')}", ex)
    end
  end
end