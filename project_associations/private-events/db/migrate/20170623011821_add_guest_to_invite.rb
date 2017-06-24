class AddGuestToInvite < ActiveRecord::Migration[5.0]
  def change
    add_reference :invites, :attended_event, foreign_key: true
    add_reference :invites, :attendee, foreign_key: true
  end
end
