class UsersController < ApplicationController


  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :omniauth)
  end
end