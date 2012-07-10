class CreateDoclists < ActiveRecord::Migration
  def self.up
    create_table :doclists do |t|
      t.string :name
      t.datetime :last_time_modified
      t.timestamps
    end
  end

  def self.down
    drop_table :doclists
  end
end
