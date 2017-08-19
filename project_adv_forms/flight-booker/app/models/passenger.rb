class Passenger < ApplicationRecord
  
  belongs_to :booking
  
  before_save :downcase_email
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  presence:   true,
                    length:     { maximum: 63 }
  validates :email, presence:   true,
                    length:     { maximum: 255 },
                    uniqueness: { case_sensitive: false },
                    format:     { with: VALID_EMAIL_REGEX }
                    
  private
  
    def downcase_email
      email.downcase!
    end
  
end
