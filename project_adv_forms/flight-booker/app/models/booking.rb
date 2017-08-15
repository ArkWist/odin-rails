class Booking < ApplicationRecord
  
  belongs_to :flight
  
  has_many :passengers, foreign_key: :booking_id,
                        dependent:   :destroy
  
  accepts_nested_attributes_for :passengers#, reject_if: :passenger_invalid / :all_blank
  
  validates_associated :passengers
  
  validates :passengers, presence: :true
  
end
