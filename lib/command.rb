#############################################################################
# Command - Handles each command that is being called by the script
# Author: Nevin Jojo
#############################################################################

require 'logger'

class Command

  # @param [String] action - action that is made on the driver
  # @param [String] params - parameter that relates to each action of the command
  # @param [WebDriver] driver - Selenium driver that is used
  def initialize(driver, action, params)
    @driver = driver
    @action = action
    @params = params
  end

  def execute
    case @action
    when 'output'
      set_report_file
    when '#'
      # Comments in scripts are ignored.
    when 'refresh'
      refresh_page
    when 'test'
      initialise_test_script
    when 'description'
      description
    when 'goto'
      goto
    when 'login'
      login
    when 'logout'
      logout
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    when '#'
      puts '#'
    else
      # type code here
    end
  end

  # Sets a new Output file to write the test results to.
  def set_report_file
    if @params[0].include? '.txt'
      $results = Results.new(@driver, @params[0])
      $results.print('New Output file: ' + @params[0])
    end
  end

  # Refreshes the current page.
  def refresh_page
    @driver.navigate.refresh
  end

  # Creates a time stamp for each test.
  def initialise_test_script
    $results.log("\r" + "#### Avenir Testing: " + @params.join(' ') + " ####")
    $results.log("####  Time: " + $time.strftime("%Y-%m-%d %H:%M:%S") + "  ####")

    #Resets the session \when a new test is run
    $session.reset
  end

  # Description records the purpose of each test.
  def description
    $results.log("####  Description: " + @params.join(' ') + "  ####")
  end

  # Navigates to a particular url that is stored in the yaml file.
  def goto
    begin
      $results.log_action(@action)
      @driver.navigate.to($config[@params.join(' ')])
      $results.success
    rescue => ex
      $results.fail(@action, ex)
    end
  end

  # Logs into the account using the login details provided by the yaml file.
  def login
    begin
      $results.log_action(@action)
      $login.login($config[@params[0]], $config[@params[1]])
      $results.success
    rescue => ex
      $results.fail(@action, ex)
    end
  end

  # Logs out of the account and waits /until the login page is found.
  def logout
    begin
      $results.log_action(@action)
      $login.logout
      $session.wait_until(@driver.find_element(:id, 'username').displayed?)
      $results.success
    rescue => ex
      $results.fail(@action, ex)
    end
  end


end