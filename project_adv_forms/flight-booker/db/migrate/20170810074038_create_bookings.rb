class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integers :flight_id, foreign_key: true

      t.timestamps
    end
  end
end
