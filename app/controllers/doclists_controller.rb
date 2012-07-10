class DoclistsController < ApplicationController
  def index
    @doclists = Doclist.all
  end

  def show
    @doclist = Doclist.find(params[:id])
  end

  def new
    @doclist = Doclist.new
  end

  def create
    @doclist = Doclist.new(params[:doclist])
    if @doclist.save
      redirect_to @doclist, :notice => "Successfully created doclist."
    else
      render :action => 'new'
    end
  end

  def edit
    @doclist = Doclist.find(params[:id])
  end

  def update
    @doclist = Doclist.find(params[:id])
    if @doclist.update_attributes(params[:doclist])
      redirect_to @doclist, :notice  => "Successfully updated doclist."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @doclist = Doclist.find(params[:id])
    @doclist.destroy
    redirect_to doclists_url, :notice => "Successfully destroyed doclist."
  end
end
