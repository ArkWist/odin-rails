class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attended_events, class_name: "Event", foreign_key: :attendee_id, 
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: true }
end
