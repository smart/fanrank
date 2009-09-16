class AddTokenToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :token, :string
  end

  def self.down
    remove_column :profiles, :token
  end
end
