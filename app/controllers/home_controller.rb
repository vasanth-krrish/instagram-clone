class HomeController < ApplicationController
  layout "krish"
  before_action :authenticate_user!

  def profile
    @user = User.find_by(username: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user.username) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user.username) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.delete
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :username, :email, :password, :password_confirmation, :current_password, :contact, :bio, :avatar_shot, :website, :gender)
  end

end
