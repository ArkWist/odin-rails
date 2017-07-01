class User < ApplicationRecord
  has_many :events,  foreign_key: :creator_id,  dependent: :destroy
  has_many :invites, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, class_name: "Event", through: :invites
  
  #before_save { self.email = email.downcase }
  
  validates :name,  presence:   true, length: { maximum: 64 },
                    uniqueness: { case_sensitive: true }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #validates :email, presence:   true, length: { maximum: 256 },
  #                  format:     { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? \
      BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
