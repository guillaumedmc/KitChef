class AddChefToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :chef_id, :integer
  end
end
