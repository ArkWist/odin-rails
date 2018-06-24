class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :origin
      t.references :destination
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
