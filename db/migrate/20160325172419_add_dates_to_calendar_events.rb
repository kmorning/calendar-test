class AddDatesToCalendarEvents < ActiveRecord::Migration
  def change
    add_column :calendar_events, :from, :date
    add_column :calendar_events, :to, :date
  end
end
