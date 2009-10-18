class CreateDataSources < ActiveRecord::Migration
  def self.up
    create_table :data_sources do |t|
      t.string :type, :name, :keyword
      t.timestamps
    end
  end

  def self.down
    drop_table :data_sources
  end
end
