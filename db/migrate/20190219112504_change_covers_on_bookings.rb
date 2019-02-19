class ChangeCoversOnBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :covers, :number_of_covers
  end
end
