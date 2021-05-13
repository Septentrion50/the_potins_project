class LikesController < ApplicationController
  def create
    @like = Like.create(
      user: current_user,
      like_target_id: params[:id],
      like_target_type: params[:type]
    )
    redirect_back(fallback_location: gossips_path)
  end

  def destroy
  end
end
