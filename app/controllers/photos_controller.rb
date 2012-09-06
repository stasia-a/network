class PhotosController < ApplicationController

  def new
    @photo = photos.new()
  end
  
  def index
    @photos = photos.find(:all) 
  end 

  def edit 
    @photo = photos.find(params[:id])
  end

  def create
    @photo = photos.new(params[:photo])
    if @photo.save 
      flash[:notice] = "Photo has baan successfully saved!"
      redirect_to user_photos_path(@user)
    else 
      render 'new'
    end
  end

  def show   
    @photo = photos.find(params[:id]) 
  end

  def update
    @photo = photos.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Photo has baan successfully updated!"
      redirect_to user_photos_path(@user)
    else
      render 'edit'
    end
  end
 
  def destroy
    @photo = photos.find(params[:id])
    @photo.destroy
    redirect_to user_photos_path(current_user)
  end

  private
 
  def photos
    @user ? @user.photos : Photo
  end
end
