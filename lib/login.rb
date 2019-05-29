#Avenir Testing 
#Class that handles the logins 
#
class Login

    def initialize(driver)
        @driver = driver
    end

    def login(user, pass)
        #Logging in - Typing in Username
        username = @driver.find_element(:id, "username")
        username.send_keys(user)
        #Logging in - Typing in Password
        pw = @driver.find_element(:id, "password")
        pw.send_keys(pass)
        #Logging in - submitting username and password
        submit = @driver.find_element(:id, "btn-login")
        submit.click
    end 

    def logout
        n = @driver.find_elements(:class, 'caret')
        n[1].click
        out = @driver.find_element(:link_text, 'Logout').click
    end
end