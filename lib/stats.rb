######################################################################
# Stats - Records stats from the testing framework execution.
# Author: Nevin Jojo
######################################################################

require 'logger'

# Handles the statistics behind each execution of the testing framework.
class Stats

  # @param [Dir] result_dir - The directory that is being analysed
  def initialize(result_dir)
    @result_dir = result_dir
  end
end
