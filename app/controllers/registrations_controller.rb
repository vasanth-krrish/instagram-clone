class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:avatar, :name, :username, :email, :password, :password_confirmation, :contact, :bio, :avatar_shot, :website, :gender)
  end

  def account_update_params
    params.require(:user).permit(:avatar, :name, :username, :email, :password, :password_confirmation, :current_password, :contact, :bio, :avatar_shot, :website, :gender)
  end

end
