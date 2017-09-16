class Booking < ApplicationRecord
  
  belongs_to :flight
  
  has_many :passengers, foreign_key: :booking_id,
                        dependent:   :destroy,
                        inverse_of:  :booking
  
  validates_associated :passengers
  accepts_nested_attributes_for :passengers, reject_if: :all_blank
  
  # prevents seeds from working
  validates :passengers, presence: true
  
end
