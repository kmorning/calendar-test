class AddCalendarRefToCalendarEvents < ActiveRecord::Migration
  def change
    add_reference :calendar_events, :calendar, index: true, foreign_key: true
  end
end
