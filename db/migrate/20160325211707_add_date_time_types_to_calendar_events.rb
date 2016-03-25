class AddDateTimeTypesToCalendarEvents < ActiveRecord::Migration
  def change
    add_column :calendar_events, :from, :datetime
    add_column :calendar_events, :to, :datetime
  end
end
