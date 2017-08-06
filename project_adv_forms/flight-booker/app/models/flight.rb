class Flight < ApplicationRecord
  belongs_to :origin,      class_name: "Airport"
  belongs_to :destination, class_name: "Airport"
                           
  validates :origin,      presence: true
  validates :destination, presence: true
  validates :start_time,  presence: true
  validates :duration,    presence: true,
                          numericality: { :greater_than => 0 }
end