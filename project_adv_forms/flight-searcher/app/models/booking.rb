class Booking < ApplicationRecord
  
  belongs_to :flight
  
  has_many :passengers, foreign_key: :booking_id,
                        dependent:   :destroy,
                        inverse_of:  :booking
  
  validates_associated :passengers
  
  accepts_nested_attributes_for :passengers, reject_if: :missing_passenger?
  
  validates :passengers, presence: true
  
  private
  
    def missing_passenger?(passenger)
      passenger[:name].blank? || passenger[:email].blank?
      
      # TODO: Figure out why verification works ONLY when this is present
      puts "#{passenger[:name]} #{passenger[:email]}"
    
    end
  
end
