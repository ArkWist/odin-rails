class ResetStartTimeInFlights < ActiveRecord::Migration[5.0]
  def up
    change_column :flights, :start_time, :datetime
  end
  
  def down
    change_column :flights, :start_time, :time
  end
end
