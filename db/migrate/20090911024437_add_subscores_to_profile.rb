class AddSubscoresToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :subscores, :text
  end

  def self.down
    remove_column :profiles, :subscores
  end
end
