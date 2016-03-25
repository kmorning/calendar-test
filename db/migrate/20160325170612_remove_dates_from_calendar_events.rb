class RemoveDatesFromCalendarEvents < ActiveRecord::Migration
  def change
    remove_column :calendar_events, :from_date, :date
    remove_column :calendar_events, :from_time, :time
    remove_column :calendar_events, :to_date, :date
    remove_column :calendar_events, :to_time, :time
  end
end
