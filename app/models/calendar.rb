class Calendar < ActiveRecord::Base
  has_many :calendar_events, dependent: :destroy
  validates_presence_of :name, :color
end
