class UsersController < ApplicationController

  def create
    @user = User.create!(params[:user])
    redirect_to cats_url
  end

  def new
    render :new
  end

end
