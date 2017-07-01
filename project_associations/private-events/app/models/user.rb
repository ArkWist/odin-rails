class User < ApplicationRecord
  has_many :events,  foreign_key: :creator_id,  dependent: :destroy
  has_many :invites, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, class_name: "Event", through: :invites
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: true }

  
end
