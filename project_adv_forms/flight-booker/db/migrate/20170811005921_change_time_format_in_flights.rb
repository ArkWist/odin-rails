class ChangeTimeFormatInFlights < ActiveRecord::Migration[5.0]
  def up
    change_column :flights, :start_time, :time
  end
  
  def down
    change_column :flights, :start_time, :datetime
  end
end
