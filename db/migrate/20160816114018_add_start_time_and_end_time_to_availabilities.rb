class AddStartTimeAndEndTimeToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :start_time, :datetime
    add_column :availabilities, :end_time, :datetime
  end
end
