class RemoveStartTimeAndEndTimeFromAvailabilities < ActiveRecord::Migration[5.0]
  def change
    remove_column :availabilities, :start_time, :time
    remove_column :availabilities, :end_time, :time
  end
end
