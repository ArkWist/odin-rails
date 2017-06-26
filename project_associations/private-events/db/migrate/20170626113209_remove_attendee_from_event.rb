class RemoveAttendeeFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :attendee, :reference
  end
end
