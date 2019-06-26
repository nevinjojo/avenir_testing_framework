######################################################################
# Args - Formats and returns user input arguments appropriately.
# Author: Nevin Jojo
######################################################################

class Args

  # Returns the WebDriver based on the browser option selected by the user.
  #
  # Default Browser: Chrome
  # @return [driver]
  def get_driver
    case ARGV[0]
    when 'chrome'
      return Selenium::WebDriver.for :chrome
    when 'firefox'
      return Selenium::WebDriver.for :firefox
    when 'iexplorer'
      return Selenium::WebDriver.for :ie
    when 'safari'
      return Selenium::WebDriver.for :safari
    else
      return Selenium::WebDriver.for :chrome
    end
  end

  # Returns the list of filenames in a directory / subdirectories
  #
  # @return [String] files
  def get_files
    if ARGV.length == 1
      name = ARGV[0]
    elsif ARGV.length == 2
      name = ARGV[1]
    end

    if name.include? ".txt"
      files = [] << name
    else
      files = Dir.glob(name + "/**/*.txt")
    end
    return files
  end

end