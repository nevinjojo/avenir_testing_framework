######################################################################
# Login - Handles the login to the system(s).
# Author: Nevin Jojo
######################################################################

# Handles the login for the system(s). The login and logout
# methods uses the WebDriver to input login detail and click on
# logout buttons.
class Login

  def initialize(driver)
    @driver = driver
  end

  # Logs in to the system.
  #
  # Enter username and password to login form and submit the form.
  # @param [String] user
  # @param [String] pass
  def login(user, pass, button = 'btn-login')
    @driver.find_element(:id, 'username').send_keys(user)
    @driver.find_element(:id, 'password').send_keys(pass)
    @driver.find_element(:id, button).click
  end

  # Logs out of the system by clicking on the menu button.
  #
  # 1. Selects the second menu caret where logout button is situated.
  # 2. Clicks on the logout button once drop down menu shows up.
  def logout
    n = @driver.find_elements(:class, 'caret')
    n[1].click
    @driver.find_element(:link_text, 'Logout').click
  end

end