class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :fan_id
      t.string :type, :identifier
      t.text :data
      t.decimal :score, :precision => 10, :scale => 4
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
