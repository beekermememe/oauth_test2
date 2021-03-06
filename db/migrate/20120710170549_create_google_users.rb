class CreateGoogleUsers < ActiveRecord::Migration
  def self.up
    create_table :google_users do |t|
      t.string :uuid
      t.string :token
      t.integer :expires_at
      t.boolean :expires
      t.string :email
      t.string :name
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end

  def self.down
    drop_table :google_users
  end
end
