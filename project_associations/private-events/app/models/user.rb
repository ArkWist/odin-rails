class User < ApplicationRecord
  has_many :events
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: true }
end
