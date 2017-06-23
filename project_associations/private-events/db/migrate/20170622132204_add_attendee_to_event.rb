class AddAttendeeToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :attendee, foreign_key: true
  end
end
