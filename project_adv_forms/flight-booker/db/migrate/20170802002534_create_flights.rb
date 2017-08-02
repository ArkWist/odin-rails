class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :origin, foreign_key: true
      t.references :destination, foreign_key: true
      t.datetime :start_time
      t.time :duration

      t.timestamps
    end
  end
end
