class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_google_id(auth_hash["uid"])
    @user.update_attributes(
      :google_picture => auth_hash["info"]["picture"],
      :name => auth_hash["info"]["name"],
      :google_first_name => auth_hash["info"]["first_name"],
      :google_last_name => auth_hash["info"]["last_name"],
      :google_email => auth_hash["extra"]["raw_info"]["verified_email"]  == true ? auth_hash["email"] : "",
      :google_expires_at => auth_hash["credentials"]["expires_at"],
      :google_token => auth_hash["credentials"]["token"],
      :google_expires => auth_hash["credentials"]["expires"]
    )
    self.current_user = @user
    redirect_to "/"
  end

  def destroy

  end
private

  def auth_hash
    request.env['omniauth.auth']
  end

end
