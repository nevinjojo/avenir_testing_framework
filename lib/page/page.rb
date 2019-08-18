######################################################################
# Page - Abstract class that holds functions and elements a page has.
# Author: Nevin Jojo
######################################################################

require_relative '../../lib/results'

# Elements that
class Page

  # @param [WebDriver] driver - The driver that will be used during the process.
  def initialize(driver)
    @driver = driver
  end

  # Checks the validity of the id provided.
  # @param [String] item
  def id_present?(item)
    begin
      @driver.find_element(:id, item).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      $results.info("Cannot find id / id does not exist")
    end
  end

  # Returns the 'home' link and navigates the website to the home page.
  # @return [Selenium_Element] Home
  def home
    if @driver.find_element(:link_text, 'Home').displayed?
      @driver.find_element(:link_text, 'Home')
    else
      $results.info("Cannot find Home link")
    end
  end

  # Returns the 'previous' link and navigates the website to the previous page.
  # @return [Selenium_Element] Home
  def previous
    if @driver.find_element(:link_text, 'Previous').displayed?
      @driver.find_element(:link_text, 'Previous')
    else
      $results.info("Cannot find Previous link")
    end
  end

  # Returns the 'Menu' button on the current page.
  # @return [Selenium_Element] Menu
  def menu
    # Click on either Menu link or hamburger button based on the screen size.
    # Note: `toggle` for normal web support, `toggler` for settle web, boot4 support
    begin
      if @driver.find_element(:class, 'navbar-toggle').displayed?
        unless @driver.find_element(:id, 'main-menu').displayed?
          @driver.find_element(:class, 'navbar-toggle').click
        end
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      # If this button isn't visible, try `toggler`
      begin
        if @driver.find_element(:class, 'navbar-toggler').displayed?
          unless @driver.find_element(:id, 'main-menu').displayed?
            @driver.find_element(:class, 'navbar-toggle').click
          end
        end
      rescue Selenium::WebDriver::Error::NoSuchElementError
        # Do nothing; if this button isn't visible, don't panic...
      end
    end

    begin
      if @driver.find_element(:id, 'main-menu').displayed?
        @driver.find_element(:id, 'main-menu')
      elsif @driver.find_element(:link_text, 'Menu').displayed?
        @driver.find_element(:link_text, 'Menu')
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      menus = @driver.find_elements(:class, 'dropdown-toggle')
      menus[0]
    end
  end

  # Returns the particular menu item link on current page.
  # @return [Selenium_Element] Menu_Item
  def menu_item(item)
    begin
      @driver.find_element(:id, 'menu' + item).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      @driver.find_element(:link_text, item.split.map(&:capitalize).join(' '))
    end
  end

  # Returns the user menu button on current page.
  # @return [Selenium_Element] User_Menu
  def user_menu
    begin
      if @driver.find_element(:id, 'user-menu').displayed?
        return @driver.find_element(:id, 'user-menu')
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      if @driver.find_element(:class, 'navbar-toggle').displayed?
        return @driver.find_element(:class, 'navbar-toggle')
      end
    end
  end

  # Returns the particular user menu item link on current page.
  # @return [Selenium_Element] User_Menu_Item
  def user_menu_item(item)
    begin
      @driver.find_element(:id, 'user_menu' + item).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      @driver.find_element(:link_text, item.split.map(&:capitalize).join(' '))
    end
  end

  # Returns the navbar brand element.
  # @return [Selenium_Element] navbar-brand
  def navbar_brand
    begin
      if @driver.find_element(:class, 'navbar-brand').displayed?
        return @driver.find_element(:class, 'navbar-brand')
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      $results.info("Cannot find navbar brand")
    end
  end

  # Returns the navbar text element.
  # @return [Selenium_Element] navbar-text
  def navbar_text
    begin
      if @driver.find_element(:class, 'navbar-text').displayed?
        return @driver.find_element(:class, 'navbar-text')
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      $results.info("Cannot find navbar text")
    end
  end

  # Returns the navbar date element.
  # @return [Selenium_Element] navbar-date
  def navbar_date
    begin
      if @driver.find_element(:class, 'business-date pull-right').displayed?
        return @driver.find_element(:class, 'business-date pull-right')
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      $results.info("Cannot find navbar date")
    end
  end

  # Finds the id displayed for a particular object created in the system and saving the id to `temp_id` variable.
  def save_id(action)
    begin
      $results.log_action(action)
      if @driver.find_element(:css, 'h1 > small')
        h1_string = @driver.find_element(:css, 'h1 > small').attribute('innerText')
        extracted_id = h1_string[/\(([^()]*)\)/] # Fetch the string inside the brackets
        if extracted_id.nil?
          extracted_id = h1_string
        end
        if h1_string.include? ')'
          h1_string = extracted_id[1..-1].chomp(')')
        end
        if h1_string.include? '('
          h1_string = h1_string.split(/\(([^()]*)\)/)
          $results.success
        end
        $session.temp_id = h1_string
        $results.append($session.temp_id)
        $results.success
      end
    rescue => ex
      $results.info("#{ex.class}: #{ex.message}")
      $results.fail(action, ex)
    end
  end

  # Scrolls the view to include the position of a specific element in the page (by id).
  # The target element must be 'visible' in the sense that you could normally see \it \if you scrolled to it.
  def scroll_to(params)
    begin
      $results.log_action('scrollto')
      @driver.find_element(:id, params[0]).location_once_scrolled_into_view
      $session.success = true
      $results.success
    rescue => ex
      $session.success = false
      $results.fail("scrollto (#{params.join(' ')})", ex)
    end
  end

  # Clicks on the first element found by one of several search criteria.
  # The element to be clicked could be found using its id, text, \class, or xpath
  # The element will only be clicked \if it is displayed, \else it fails
  #
  # references to the element:
  # id - clicks by id of the element
  # \class - clicks by the list of classes that are applied to the element
  # text - clicks by the text within element. If there are multiple similar text, specify which one to choose using the last argument
  #
  # Note: quotations in xpath is not supported for this function (i.e. //*[@id="data"]). This is because other arguments such as text could have quotations which are usually removed.
  def click_by(params)
    begin
      $results.log_action("clickby #{params[0]}")
      case params[0]
      when 'id'
        element = @driver.find_element(:id, params[1])
      when 'class'
        element = @driver.find_element(:css, params[1..-1].join('.').gsub(/(^(?!\.)|\.{2,})/, '.'))
      when 'text'
        # find the element that matches the text specified in the script. If there are two elements, then choose the one specified in the script as the last argument.
        if params[-1].match(/\A-?\d+\Z/)
          elements = @driver.find_elements(:xpath, "//*[contains(text(), '" + params[1..-2].join(' ') + "')]")
          element = elements[params[-1].to_i - 1]
          @driver.execute_script("arguments[0].click();", element)
          $results.success
          return
        else # Otherwise, click on the text that contains the whole text
          element = @driver.find_element(:xpath, "//*[contains(text(), '" + params[1..-1].join(" ") + "')]")
        end
      when 'xpath'
        xpath = params[1..-1].join('')
        element = @driver.find_element(:xpath, xpath)
      end

      #Once the element is found, check \if it is displayed on the screen and then click it.
      if element.displayed?
        element.click
        $session.success = true
        $results.success
      else
        $session.success = false
        $results.fail("clickby #{params.join(' ')}")
      end
    rescue => ex
      $session.success = false
      $results.fail("clickby #{params[0]}", ex)
    end
  end

  def smart_split
    sa = self.split(/"/).collect {|x| x.strip}
    return (1..sa.length).zip(sa).collect {|i, x| (i & 1).zero? ? x : x.split}.flatten
  end

  # Navigates to a particular url that is stored in the yaml file.
  def go_to(params)
    begin
      $results.log_action('goto')
      @driver.navigate.to($config[params.join(' ')])
      $results.success
    rescue => ex
      $results.fail('goto', ex)
    end
  end

  # Navigates back to the page driver was before.
  def go_back
    begin
      $results.log_action('back')
      @driver.navigate.back
      #wait for the new page to load
      $session.wait_for_stale
      $results.success
    rescue => ex
      $results.failure(ex)
    end
  end
end
