class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :origin_id, foreign_key: true
      t.integer :destination_id, foreign_key: true
      t.datetime :start_time
      t.time :duration

      t.timestamps
    end
  end
end
