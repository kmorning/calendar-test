class RemoveCalendarIdFromCalendarEvents < ActiveRecord::Migration
  def change
    remove_column :calendar_events, :calendar_id, :integer
  end
end
