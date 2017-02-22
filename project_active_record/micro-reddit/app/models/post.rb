class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many   :comment

  validates :title,   presence: true#, length: { maximum: 255 }
  validates :link,    presence: true
  validates :user_id, presence: true
end
