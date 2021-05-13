class LikesController < ApplicationController

  before_action :authenticate_user

  def create
    @like = Like.create(
      user: current_user,
      like_target_id: params[:id],
      like_target_type: params[:type]
    )
    redirect_back(fallback_location: gossips_path)
  end

  def destroy
    @like = Like.where(like_target_id: params[:id], like_target_type: params[:type], user: current_user)
    @like[0].destroy
    redirect_back(fallback_location: gossips_path)
  end
end
