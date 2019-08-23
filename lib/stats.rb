######################################################################
# Stats - Records stats from the testing framework execution.
# Author: Nevin Jojo
######################################################################

require 'logger'
require 'csv'

# Handles the statistics behind each execution of the testing framework.
class Stats

  # @param [stats_dir] - The directory that is being analysed
  def initialize(stats_dir)
    @stats_dir = stats_dir
  end

  # Iterate through each files in the stats directory and scan through them to find the failure rate.
  # Failure rate for each test result file is recorded in a csv file and added to the stats directory.
  def get_failure_rate
    names = []
    failure_counts = []
    total_actions_counts = []
    @stats_dir.each { |filename|
      if File.exists?(filename)
        name, failure_count, total_actions = find_failure_rate(filename)
        if !name.nil? and !failure_count.nil? and !total_actions.nil?
          names.push(name)
          failure_counts.push(failure_count)
          total_actions_counts.push(total_actions)
        end
      end
    }
    record_failure_rates(names, failure_counts, total_actions_counts)
  end

  # Looks for lines in the file that checks for test name test stats and return them (if any).
  def find_failure_rate(filename)
    begin
    name_line = File.foreach(filename).detect { |line| line.include?('Avenir Testing:')}
    stats_line = File.foreach(filename).detect { |line| line.include?('Test Analysis:')}
    name = name_line.split(/:(.*?)#/)[1].strip
    stat = stats_line.split(/:(.*?)t/)[1].strip
    failure_count = stat.split('/')[0]
    total_actions = stat.split('/')[1]
    return name, failure_count, total_actions
    rescue => ex
      # Do nothing: There could be result files that does not have stats recorded
    end
  end

  # Records the list of failure rates for each test result files in a csv file
  def record_failure_rates(names, failure_counts, total_actions_counts)
    CSV.open("stats.csv", "wb") do |csv|
      (0..names.length).each { |i|
        csv << [names[i], failure_counts[i], total_actions_counts[i]]
      }
    end
  end
end
