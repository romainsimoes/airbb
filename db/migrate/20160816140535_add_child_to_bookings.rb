class AddChildToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :child, foreign_key: true
  end
end
