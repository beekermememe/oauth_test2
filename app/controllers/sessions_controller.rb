class SessionsController < ApplicationController

  def create
    binding.pry()
    if params[:provider] == "google_oauth2"
      create_google(params)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out"
  end

  def deauth
    if params[:auth_type] == "google_oauth2"
      deauth_google
    elsif params[:auth_type] == "dish_oauth"
      deauth_dish
    else
      redirect_to root_url, notice: "Auth type not recognized"
    end
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end

  def create_google(params)
    binding.pry()
    @user = User.from_google_omni_auth(auth_hash)
    session[:user_id] = @user.id
    redirect_to "/", notice: "Signed in using google id"
  end

  def create_dish
    binding.pry()
    @user = User.from_google_omni_auth(auth_hash)
    session[:user_id] = @user.id
    redirect_to "/", notice: "Signed in using dish user id"
  end


  def deauth_google
    @user.google_user.delete
    redirect_to root_url,  notice: "You no longer have access to Google Services from this site"
  end

  def deauth_dish
   @user.dish_user.delete
   redirect_to root_url, notice: "You no longer have access to Dish Services from this site"
  end

end
