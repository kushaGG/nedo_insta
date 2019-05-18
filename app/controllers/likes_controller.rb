class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_photo
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @photo.likes.create(user_id: current_user.id)
    end
      redirect_to root_path
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to root_path
  end

  def already_liked?
    Like.where(user_id: current_user.id, photo_id:
    params[:photo_id]).exists?
  end

  private

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end

  def find_like
    @like = @photo.likes.find(params[:id])
  end
end
