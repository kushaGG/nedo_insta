class UsersController < ApplicationController
  before_action :set_user,       only: [:show, :edit, :update, :destroy, :following, :followers]

def index
  @users = User.all
end

def show
  @photo = Photo.new
  @photos = @user.photos.paginate(page: params[:page])
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
