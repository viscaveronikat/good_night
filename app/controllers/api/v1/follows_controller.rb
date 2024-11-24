class Api::V1::FollowsController < ApplicationController
  # POST /follows
  def create
    follow = Follow.new(follow_params)
    if follow.save
      render json: follow, status: :created
    else
      render json: { errors: follow.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /follows
  def destroy
    follow = Follow.find_by(user_id: params[:user_id], followed_user_id: params[:followed_user_id])
    if follow
      follow.destroy
      render json: { message: "Unfollowed successfully" }, status: :ok
    else
      render json: { error: "Follow relationship not found" }, status: :not_found
    end
  end

  private

  def follow_params
    params.require(:follow).permit(:user_id, :followed_user_id)
  end
end
