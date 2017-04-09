class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(first_name: omniauth_options[:first_name], last_name: omniauth_options[:last_name], omniauth: true)
    if @user
      session[:id] = @user.id
      redirect_to root_path
    else
      render 'users/new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      {
        first_name: auth_hash[:info][:name].split.first,
        last_name: auth_hash[:info][:name].split.last
      }
    end
  end
end