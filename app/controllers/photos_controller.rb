class PhotosController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :find_photo, only:[:show, :edit, :update, :destroy]

  def index
    @photo = Photo.new
  end

  def new
    @photo = Photo.new
  end

  def create
    #code
  end

  def show
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private
  def photo_params
    params.require(:photo).permit(:user_id, :description, {photos: []})
  end

  def find_photo
    @photo = Photo.find_by(id: params[:id])
  end
end
