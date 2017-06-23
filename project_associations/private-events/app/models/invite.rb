class Invite < ApplicationRecord
  belongs_to :event
  has_one    :guest, class_name: "User"
end
