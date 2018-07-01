class AddIndexToAirports < ActiveRecord::Migration[5.2]
  def change
    add_index :airports, :iata, unique: true
  end
end
