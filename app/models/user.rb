class User < ActiveRecord::Base
  has_one :google_user
  has_one :dish_user
  

  attr_accessible :google_id, :google_picture, :name, :google_email, :google_first_name, :google_last_name
    def self.from_google_omni_auth(auth_hash)
      @user = nil
      google_user = GoogleUser.find_or_create_by_uuid(auth_hash["uid"])
      if google_user.user_id.nil?
        @user = User.create
        @user.google_user = google_user
      else
        @user = google_user.user
      end
      
      @user.google_user.update_attributes(
        :name => auth_hash["info"]["name"],
        :first_name => auth_hash["info"]["first_name"],
        :last_name => auth_hash["info"]["last_name"],
        :email => auth_hash["extra"]["raw_info"]["verified_email"]  == true ? auth_hash["email"] : "",
        :expires_at => auth_hash["credentials"]["expires_at"],
        :token => auth_hash["credentials"]["token"],
        :expires => auth_hash["credentials"]["expires"],
        :uuid => auth_hash["uid"]
      )
      @user.save
      @user
    end
end
