class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :google_auth_id
      t.string :saml_auth_id
      t.string :name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
