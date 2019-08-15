######################################################################
# Table - Inspect table elements and its sub-elements.
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the table element testing functions.
class Table

  # @param [Object] driver - The driver that will be used during the process.
  # @param [Object] params - The parameters that are provided along with the button command.
  def initialize(driver, params)
    @driver = driver
    @params = params
  end

  # Returns a true /if a button with a particular id is displayed, and vice-versa.
  def content_displayed?
    begin
      if @driver.find_element(:xpath, '//*[@id="data"]/tbody/tr/td[3]').displayed?
        true
      end
    rescue
      false
    end
  end

  # Clicks on an element in a particular column based on it's value
  #
  # Step 1: Find table in the webpage
  # Step 2: Find the column number in the head row that matches the column name we are looking for
  # Step 3: Search each row in the child rows for the value we are looking for in a particular column number
  # Step 4: Once the element is found in one of the rows, click on it.
  def click_item
    begin
      # If the ID we are looking for already exist, use that
      @params[1] = (@params[1] == 'saveID') ? $session.temp_id : @params[1]

      $results.log_action("tableClick(#{[@params.join(' ')]})")
      head = []  # Head row values
      item = nil # item that we are attempting to fetch
      @params[0][0] = @params[0][0].upcase

      # Fetch head row of the table
      if @driver.find_element(:xpath, '//*[@id="data"]/thead/tr/th').displayed?
        head = @driver.find_elements(:xpath, '//*[@id="data"]/thead/tr/th').map(&:text)
      end

      # Fail proofing: Waits \until page loads all data content
      $session.wait_until(@driver.find_element(:xpath, '//*[@id="data"]/tbody/tr[1]').displayed?)

      col_num = head.index(@params[0]) # column number where element type is present
      if col_num != nil
        body = @driver.find_elements(:xpath, "//*[@id='data']/tbody/tr")  # child row values
        if body.length == 0
          puts "Table body is empty"
          $results.failure('tableClick')
        end

        # Iterate through the rows and find the row with the value we are looking for and click it
        (1..body.length).each { |row_num|
          begin
            item = @driver.find_element(:xpath, "//*[@id='data']/tbody/tr[#{row_num}]/td[#{col_num + 1}]")
            if item.text == @params[1]
              item.click
              $session.wait_for_stale
              $results.success
            end
          rescue Selenium::WebDriver::Error::NoSuchElementError
            # Do nothing
          end
        }
         # If item is still nil, then it doesn't exist or could not be found
         if item == nil
           $results.append("Could Not Find '#{@params[1]}'")
         end
      end
    rescue => ex
      $results.fail('tableClick', ex)
    end
  end
end