class FollowingsController < ApplicationController

  def create
    @following = current_user.followings.build
    @following.following = params[:id]
    if @following.save
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @following = Following.find_by(following: params[:id], user_id: current_user.id)
    @following.destroy
    redirect_back fallback_location: root_path
  end

end
