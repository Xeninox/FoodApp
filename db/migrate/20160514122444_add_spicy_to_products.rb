class AddSpicyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :spicy, :boolean
  end
end
