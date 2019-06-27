######################################################################
# Page - Abstract class that holds functions and elements a page has.
# Author: Nevin Jojo
######################################################################

require '../../lib/results'

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
    begin
      # Note: `toggle` for normal web support, `toggler` for settle web, boot4 support
      if @driver.find_element(:class, 'navbar-toggle').displayed? or @driver.find_element(:class, 'navbar-toggler').displayed?
        unless @driver.find_element(:id, 'main-menu').displayed?
          @driver.find_element(:class, 'navbar-toggle').click
        end
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      # Do nothing; If this button isn't visible, don't panic...
    end

    begin
      if @driver.find_element(:id, 'main-menu').displayed?
        return @driver.find_element(:id, 'main-menu')
      elsif @driver.find_element(:link_text, 'Menu').displayed?
        return @driver.find_element(:link_text, 'Menu')
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      menus = @driver.find_elements(:class, 'dropdown-toggle')
      return menus[0]
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
        return @driver.find_element(:class, 'navbar-toggle').click
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

end
