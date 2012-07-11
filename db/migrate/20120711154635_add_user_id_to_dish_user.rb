class AddUserIdToDishUser < ActiveRecord::Migration
  def change
    add_column :dish_users, :user_id, :integer
  end
end
