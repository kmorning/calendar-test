class CalendarEvent < ActiveRecord::Base
  include Repeatable

  extend TimeSplitter::Accessors
  split_accessor :from, :to

  belongs_to :calendar
  validates_presence_of :name
  validates_presence_of :calendar_id
  validates_presence_of :from
  validates_presence_of :to
  #validates_presence_of :time_zone
  #validates_presence_of :from_time, :if => :not_all_day?
  #validates_presence_of :to_time, :if => :not_all_day?

  def color
    if calendar.color
      calendar.color
    else
      'lightblue'
    end
  end

  def not_all_day?
    if is_all_day
      return false
    else
      return true
    end
  end

end
