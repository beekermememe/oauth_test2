class GoogleUsersController < ApplicationController
  def index
    @google_users = GoogleUser.all
  end

  def show
    @google_user = GoogleUser.find(params[:id])
  end

  def new
    @google_user = GoogleUser.new
  end

  def create
    @google_user = GoogleUser.new(params[:google_user])
    if @google_user.save
      redirect_to @google_user, :notice => "Successfully created google user."
    else
      render :action => 'new'
    end
  end

  def edit
    @google_user = GoogleUser.find(params[:id])
  end

  def update
    @google_user = GoogleUser.find(params[:id])
    if @google_user.update_attributes(params[:google_user])
      redirect_to @google_user, :notice  => "Successfully updated google user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @google_user = GoogleUser.find(params[:id])
    @google_user.destroy
    redirect_to google_users_url, :notice => "Successfully destroyed google user."
  end
end
