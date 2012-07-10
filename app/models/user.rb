class User < ActiveRecord::Base
  attr_accessible :google_id, :google_picture, :name, :google_email, :google_first_name, :google_last_name
end
