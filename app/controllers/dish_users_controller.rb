class DishUsersController < ApplicationController
  def index
    @dish_users = DishUser.all
  end

  def show
    @dish_user = DishUser.find(params[:id])
  end

  def new
    @dish_user = DishUser.new
  end

  def create
    @dish_user = DishUser.new(params[:dish_user])
    if @dish_user.save
      redirect_to @dish_user, :notice => "Successfully created dish user."
    else
      render :action => 'new'
    end
  end

  def edit
    @dish_user = DishUser.find(params[:id])
  end

  def update
    @dish_user = DishUser.find(params[:id])
    if @dish_user.update_attributes(params[:dish_user])
      redirect_to @dish_user, :notice  => "Successfully updated dish user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dish_user = DishUser.find(params[:id])
    @dish_user.destroy
    redirect_to dish_users_url, :notice => "Successfully destroyed dish user."
  end
end
