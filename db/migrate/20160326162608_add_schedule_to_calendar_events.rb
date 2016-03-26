class AddScheduleToCalendarEvents < ActiveRecord::Migration
  def change
    add_column :calendar_events, :schedule, :text
  end
end
