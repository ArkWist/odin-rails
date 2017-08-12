class ChangeDurationToInteger < ActiveRecord::Migration[5.0]
  def up
    change_column :flights, :duration, :integer
  end
  
  def down
    change_column :flights, :duration, :time
  end
end
