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
    age = Time.now.year - Time.parse(params[:cat][:birthday]).year
    params[:cat][:age] = age
    @cat = Cat.create!(params[:cat])
    redirect_to cats_url
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  def update
    age = Time.now.year - Time.parse(params[:cat][:birthday]).year
    params[:cat][:age] = age
    if Cat.find(params[:id]).update_attributes(params[:cat])
      redirect_to cats_url
    else
      render :edit
    end
  end

  def destroy
    Cat.find(params[:id]).destroy
    redirect_to cats_url
  end
end
