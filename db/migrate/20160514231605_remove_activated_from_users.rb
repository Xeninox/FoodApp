class RemoveActivatedFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :activated, :boolean
  end

  def self.down
    add_column :users, :activated, :boolean
  end
end
