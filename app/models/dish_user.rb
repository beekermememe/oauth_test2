class DishUser < ActiveRecord::Base
  belongs_to :user
  attr_accessible :uuid, :token, :expires_at, :expires, :email, :name, :first_name, :last_name
end
