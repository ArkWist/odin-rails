class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  
  validates :body,    presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end
