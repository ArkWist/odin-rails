class Airport < ApplicationRecord
  
  has_many :departing_flights, class_name:  "Flights",
                               foreign_key: :origin_id,
                               dependent:   :destroy
  has_many :arriving_flights,  class_name:  "Flights",
                               foreign_key: :destination_id,
                               dependent:   :destroy
  
  default_scope { order(iata: :desc) }
  
  validates :iata, presence: true
  
end
