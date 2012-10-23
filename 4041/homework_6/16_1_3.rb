require 'time'

class Activity
  attr_accessor :start_time, :end_time

  class << self
    def activity_select(ary)
      a = [ary.first]
      ary.slice(1, ary.size - 1).each do |activity|
        a.push activity if a.last.end_time <= activity.start_time
      end
      a
    end

    def overlap(ary, activity)
      count = 0
      ary.each do |element|
        next if activity.object_id == element.object_id
        count += 1 if activity.end_time.between?(element.start_time + 1, element.end_time + 1) ||
          activity.start_time.between?(element.start_time, element.end_time)
      end
      count
    end
  end

  def initialize(start_time, end_time)
    @start_time = Time.parse start_time
    @end_time = Time.parse end_time
  end

  def to_s
    "Start Time: #{start_time} End Time:#{end_time}\n"
  end
end

activities = [
  Activity.new("May 5th 8am",     "May 5th 9am"),
  Activity.new("May 5th 9am",     "May 5th 10am"),
  Activity.new("May 5th 8:45am",  "May 5th 9:30am"),
  Activity.new("May 5th 9:25am",  "May 5th 10:32am"),
  Activity.new("May 5th 10am",    "May 5th 10:30am"),
]

activities_sorted_by_starts_earliest = activities.sort { |i, j| i.start_time <=> j.start_time }

activities_sorted_by_duration = activities.sort do |i, j|
  (i.end_time - i.start_time) <=> (j.end_time - j.start_time)
end

activities_sorted_by_overlaps = activities.sort do |i, j|
  Activity::overlap(activities, i) <=> Activity::overlap(activities, j)
end

puts Activity::activity_select(activities_sorted_by_starts_earliest).map(&:to_s).join
puts "------"
puts Activity::activity_select(activities_sorted_by_duration).map(&:to_s).join
puts "------"
puts Activity::activity_select(activities_sorted_by_overlaps).map(&:to_s).join

# Output
# Start Time: 2012-05-05 08:00:00 -0500 End Time:2012-05-05 09:00:00 -0500
# Start Time: 2012-05-05 09:00:00 -0500 End Time:2012-05-05 10:00:00 -0500
# Start Time: 2012-05-05 10:00:00 -0500 End Time:2012-05-05 10:30:00 -0500
# ------
# Start Time: 2012-05-05 10:00:00 -0500 End Time:2012-05-05 10:30:00 -0500
# ------
# Start Time: 2012-05-05 08:00:00 -0500 End Time:2012-05-05 09:00:00 -0500
# Start Time: 2012-05-05 09:25:00 -0500 End Time:2012-05-05 10:32:00 -0500

