class Flight < ApplicationRecord
  belongs_to :origin,      class_name: "Airport"
  belongs_to :destination, class_name: "Airport"
  
  has_many :bookings, class_name:  "Booking",
                      foreign_key: :flight_id,
                      dependent:   :destroy
                           
  validates :origin,      presence: true
  validates :destination, presence: true
  validates :start_time,  presence: true
  validates :duration,    presence: true,
                          numericality: { :greater_than => 0 }
  
  def date_formatted
    start_time.strftime("%m/%d/%Y")
  end
  
  def depart_time_formatted
    start_time.strftime("%-H:%M")
  end
  
  def duration_formatted
    Time.at(duration).utc.strftime("%-Hh %-Mm")
  end
  
  def self.date_format
    format = "%m/%d/%Y"
  end

end