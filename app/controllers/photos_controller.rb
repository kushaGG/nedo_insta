class PhotosController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :find_photo, only:[:show, :edit, :update, :destroy]

  def index
    @photo = Photo.new
    @user = User.find_by(id: params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    #code
  end

  def edit
    #code
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path(@photo.id)
    else
      render 'edit'
    end
  end

  def destroy
    @twitt.destroy
    redirect_to root_path
  end

  private
  def photo_params
    params.require(:photo).permit(:user_id, :description, {photos: []})
  end

  def find_photo
    @photo = Photo.find_by(id: params[:id])
  end
end
