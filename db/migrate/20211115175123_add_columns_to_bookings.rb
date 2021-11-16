class AddColumnsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :user, null: false, foreign_key: true
    add_reference :bookings, :seaplane, null: false, foreign_key: true
  end
end
