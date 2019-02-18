class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :covers, :nb_of_covers
  end
end
