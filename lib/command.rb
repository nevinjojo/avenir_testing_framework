#############################################################################
# Command - Handles each command that is being called by the script
# Author: Nevin Jojo
#############################################################################

require 'logger'
require_relative 'page/home'
require_relative 'elements/button'
require_relative 'elements/input'
require_relative 'elements/table'

class Command

  # @param [String] action - action that is made on the driver
  # @param [String] params - parameter that relates to each action of the command
  # @param [WebDriver] driver - Selenium driver that is used
  def initialize(driver, action, params)
    @driver = driver
    @action = action
    @params = params
    @home = Home.new(@driver)
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
    when 'sleep'
      $session.sleep_for(@params.join.to_i)
    when 'menu'
      menu
    when 'usermenu'
      user_menu
    when 'button'
      button
    when 'form'
      # Stores the first common keyword of the input id that will be used to insert values to the fields.
      $session.form = @params.join(' ') + '_'
    when 'textInput'
      input
    when 'menuInput'
      input
    when 'checkerInput'
      input
    when 'select2Input'
      input
    when 'clearInput'
      input
    when 'tableWait'
      # Waits /until the table data is displayed.
      $session.table_wait
    when 'find'
      find_element
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
    $session = Session.new(@driver)
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

  # Finds the Menu button and clicks on Menu button.
  # This function also calls the menu_item function to click on the link within the drop down.
  def menu
    begin
      item = @params.join(' ')
      @home.menu.click
      $results.log_action("#{@action}(#{item})")
      @home.menu_item(item).click

      # Wait for the new page to load
      $session.wait_for_stale
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{@params.join(' ')})", ex)
    end
  end

  # Clicks on the user menu on the page.
  # This function also clicks on the link within the user drop down menu.
  def user_menu
    begin
      @home.user_menu.click
    rescue
      $results.fail(@action)
    end

    # Find and click on sub link
    sub_link = @params.join(' ')
    begin
      $results.log_action("#{@action}(#{sub_link})")
      @home.user_menu_item(sub_link).click

      # Wait for the new page to load
      $session.wait_for_stale
      $results.success
    rescue => ex
      $results.fail("#{@action}(#{sub_link})", ex)
    end
  end

  def button
    button = Button.new(@driver, @params)
    case @params[0]
    when 'new'
      button.new_button
    when 'cancel'
      button.cancel
    when 'new-user'
      button.new_user
    when 'download'
      button.download
    when 'order'
      button.order
    else
      button.custom
    end
  end

  def input
    element = Input.new(@driver, @action, @params)
    case @action
    when 'textInput'
      element.text_input
    when 'menuInput'
      element.menu_input
    when 'checkerInput'
      element.checker_input
    when 'select2Input'
      element.select2_input
    when 'clearInput'
      element.clear_input
    else
      $results.log("Ignoring unknown input of #{@action}.")
    end
  end

  def find_element
    begin
      $results.log_action("#{@action}(#{sub_link})")
      $session.success = false
      case @params[0]
      when 'button'
        $session.success = Button.displayed?(@params[1])
      when 'item'
        $session.success = Table.content_displayed?
      when 'textH1'
        $session.success = Text.displayed?(@params)
      else
        $results.log("Ignoring unknown element.")
      end
      if $session.success
        $results.success
      else
        $results.failure
      end
    rescue
      $session.success = false
      $results.fail("find", ex)
    end
  end

end