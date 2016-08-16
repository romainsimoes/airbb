class RemoveStartTimeAndEndTimeFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :start_time, :time
    remove_column :bookings, :end_time, :time
  end
end
