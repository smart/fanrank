class CreateFans < ActiveRecord::Migration
  def self.up
    create_table :fans do |t|
      t.string :first_name, :last_name, :email_address
      t.decimal :score, :precision => 10, :scale => 4
      t.timestamps
    end
  end

  def self.down
    drop_table :fans
  end
end
