class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :origin, foreign_key: true
      t.references :destination, foreign_key: true
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
