class ChangeCoversOnProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :covers
    add_column :products, :min_cover, :integer
    add_column :products, :max_cover, :integer
  end
end
