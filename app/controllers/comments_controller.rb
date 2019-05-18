class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = @photo.comments.includes(:user)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @photo = @comment.photo
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    if @comment.destroy
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  private
  def comment_params
    params.required(:comment).permit :user_id, :photo_id, :content
  end
end
