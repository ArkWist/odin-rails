class Event < ApplicationRecord
  belongs_to :creator,   class_name: "User"
  has_many   :attendees, class_name: "User", through: :invites
  has_many   :invites, foreign_key: :attended_event_id, dependent: :destroy
  
  validates :creator,     presence: true
  validates :title,       presence: true
  validates :date,        presence: true
  validates :description, presence: true
  validates :location,    presence: true
  
  scope :upcoming, -> { where("date >= ?", DateTime.now.to_date).order(date: :asc) }
  scope :previous, -> { where("date < ?",  DateTime.now.to_date).order(date: :desc) }
  
end
