class Flight < ApplicationRecord
  
  belongs_to :origin,      class_name: "Airport"
  belongs_to :destination, class_name: "Airport"
  
  validates :origin,      presence: true
  validates :destination, presence: true
  validates :departure,   presence: true
  validates :arrival,     presence: true
  
  validate :times_consistent?
  
  def self.date_format
    format = "%d/%m/%Y"
  end
  
  def departure_date
    self.departure.strftime("%m/%d/%Y")
  end
  
  def departure_time
    self.departure.strftime("%-H:%M")
  end
  
  def duration
    Time.at(self.arrival - self.departure).utc.strftime("%-Hh %-Mm")
  end
  
  private
  
    def times_consistent?
      if self.arrival.to_i <= self.departure.to_i
        errors.add(:arrival, 'must be later than departure') 
      end
    end
    
end
