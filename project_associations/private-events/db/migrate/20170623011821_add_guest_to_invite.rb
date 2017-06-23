class AddGuestToInvite < ActiveRecord::Migration[5.0]
  def change
    add_reference :invites, :event, foreign_key: true
    add_reference :invites, :guest, foreign_key: true
  end
end
