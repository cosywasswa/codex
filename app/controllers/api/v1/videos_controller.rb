class Api::V1::VideosController < ApplicationController

    def index
        @videos = Video.all
        if@videos
        render json: @videos.as_json(methods: [:video_url, :likes_counter])
        else
            render json: {
                status: {error: @videos.errors.full_messages}
            }, status: :unprocessable_entity
        end
    end

    def show
        @user = current_user
        @video = Video.find(params[:id])
        @total_comments = @video.comments_counter
        @total_likes = @video.likes_counter
        render json: {
            video: @video, 
            total_comments: @total_comments, 
            total_likes: @total_likes
        }
    end

    def create
        @video = Video.new(video_params)
        if @video.save 
            render json: {
                status: {
                    code: 200, massage: "video created successfully", data:@video
                }
            }, status: :ok
            else
                render json: {
                    status: {error:@video.errors.full_messages.join(',')}
                }, status: :unprocessable_entity
            end
    end

    def destroy
        @user = current_user
        @video = @user.videos.find(params[:id])
        if@video.destroy
            render json: {
                status: {code:200, message: "video deleted successfuly", data:@video}
            }, status: :ok
        else
            render json: {
                status: {error:@video.errors.full_messages}
            }, status: :unprocessable_entity
        end
    end

    private
    
    def video_params
        params.require(:video).permit(:title, :description, :user_id, :category, :video_file)
    end
end
