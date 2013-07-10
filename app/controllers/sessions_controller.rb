class SessionsController < ApplicationController


  def create
    @user = User.find_by_name(params[:user][:name])

    if @user.password = params[:user][:password]
      @session_token = SecureRandom.base64
      @user.token = @session_token
      session[:token] = @session_token
      session[:current_user_name] = @user.name

      @user.save!

      redirect_to cats_url
      #generate token
    else
      redirect_to new_session
    end

  end

  def new
    render :new
  end
end
