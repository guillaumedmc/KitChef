class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :covers
      t.boolean :status
      t.date :date
      t.integer :total_price

      t.timestamps
    end
  end
end
