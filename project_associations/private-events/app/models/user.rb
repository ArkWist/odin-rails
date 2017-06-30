class User < ApplicationRecord
  has_many :events,  foreign_key: :creator_id,  dependent: :destroy
  has_many :invites, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, class_name: "Event", through: :invites
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: true }
  
  
  #def upcoming_events
  #  events.where("date >= ?", DateTime.now.to_date)
  #  # Should show nearest first
  #end
  
  #def previous_events
  #  events.where("date < ?", DateTime.now.to_date)
  #  # Should show nearest first
  #end
  
end
