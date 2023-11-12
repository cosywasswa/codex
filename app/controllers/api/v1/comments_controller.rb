class Api::V1::CommentsController < ApplicationController
  def index
    @video = Video.find(params[:id])
    @comments = @video.comments.all
    rende json: {
      status: {
        code:200, message: "comments retrieved", data: @comments
      }
    }
  end

  def show
    @video = Video.find(params[:id])
    @comment = @video.comments.find(params[:id])
    rende json: {
      status: {
        code:200, message: "comments retrieved", data: @comment
      }
    }
  end

  def create
    @comment = Comment.new(comment_params)
    if@comment.save
      render json: {
        status: {code: 200, message: "comment created successfully", data: @comment}
      }, status: :ok
    else
render json: {
  status: {error:@comment.errors.full_messages}
}, status: :unprocessable_entity
  end
end

  def destroy
    @video = Video.find(params[:id])
    @comment = @video.comments.find(params[:id])
    if@comment.destroy
      render json: {
        status: {message: "deleted comment successfuly"}
      }, status: :ok
    else
      render json: {
        status: {error:@comment.errors.full_messages}
      }, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description, :user_id, :video_id)
  end
end
