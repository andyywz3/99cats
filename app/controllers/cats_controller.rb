class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @user = User.find_by_name(session[:current_user_name])
    if @user.token = session[:token]
      age = Time.now.year - Time.parse(params[:cat][:birthday]).year
      params[:cat][:age] = age
      params[:cat][:user_id] = @user.id
      @cat = Cat.create!(params[:cat])
      redirect_to cats_url
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  def update
    if User.find_by_token(session[:token]).id =  Cat.find(params[:id]).user_id
      age = Time.now.year - Time.parse(params[:cat][:birthday]).year
      params[:cat][:age] = age
      if Cat.find(params[:id]).update_attributes(params[:cat])
        redirect_to cats_url
      else
        render :edit
      end
    else
      redirect_tox cat_rental_requests_url
    end
  end

  def destroy
    Cat.find(params[:id]).destroy
    redirect_to cats_url
  end
end
