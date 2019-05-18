class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]

def index
  @users = User.search(params[:term])
    respond_to :js
end

def show
  @photo = Photo.new
  id = User.find_by(id: params[:id])
  @currentphoto = Photo.where(user_id: id).order("created_at DESC")
end

def following
  @title = "Following"
  @users = @user.followed_users.paginate(page: params[:page])
  render :show_follow
end

def followers
  @title = "Followers"
  @users = @user.followers.paginate(page: params[:page])
  render :show_follow
end

private
  def set_user
    @user = User.find(params[:id])
  end
end
