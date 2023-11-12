class Api::V1::LikesController < ApplicationController
  def index
    @video = Video.find(params[:id])
    @likes = @video.likes.all
    rende json: {
      status: {
        code:200, message: "likes retrieved", data: @likes
      }
    }
  end

  def create
    @like = Like.new(like_params)
    if@like.save
      render json: {
        status: {code: 200, message: "like added successfully", data: @like}
      }, status: :ok
    else
render json: {
  status: {error:@like.errors.full_messages}
}, status: :unprocessable_entity
  end
end

  def destroy
    @video = Video.find(params[:id])
    @like = @video.likes.find(params[:id])
    if@like.destroy
      render json: {
        status: {message: "deleted like successfuly"}
      }, status: :ok
    else
      render json: {
        status: {error:@like.errors.full_messages}
      }, status: :unprocessable_entity
    end
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :video_id)
  end
end
