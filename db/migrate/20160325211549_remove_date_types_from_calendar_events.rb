class RemoveDateTypesFromCalendarEvents < ActiveRecord::Migration
  def change
    remove_column :calendar_events, :from, :date
    remove_column :calendar_events, :to, :date
  end
end
