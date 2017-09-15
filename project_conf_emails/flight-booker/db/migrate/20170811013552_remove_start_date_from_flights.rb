class RemoveStartDateFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :start_date, :date
  end
end
