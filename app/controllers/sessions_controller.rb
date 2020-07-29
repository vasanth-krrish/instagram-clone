class SessionsController < Devise::SessionsController

  def create
    @user = User.find_by(contact: user_params[:username]) ||
            User.find_by(username: user_params[:username]) ||
            User.find_by(email: user_params[:username])
    if @user && @user.valid_password?(user_params[:password])
      sign_in(@user)
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
