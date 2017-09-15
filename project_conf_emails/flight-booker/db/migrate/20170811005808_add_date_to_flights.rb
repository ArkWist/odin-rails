class AddDateToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :start_date, :date
  end
end
