class AddFieldsToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :data_source_id, :integer, :null => false
  end

  def self.down
    remove_column :profiles, :data_source_id
  end
end
