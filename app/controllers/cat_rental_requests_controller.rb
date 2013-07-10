class CatRentalRequestsController < ApplicationController

  def index
    @cat_requests = CatRentalRequest.all
    render :index
  end

  def new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.create!(params[:cat_rental_request])
    redirect_to cat_rental_requests_url
  end

  # def destroy
  #   CatRentalRequest.where(:cat_id => params[:id]).each do |rec|
  #     rec.delete
  #   end
  #   render cats_url
  # end
#
#   def edit
#     @cat = Cat.find_by_id(params[:id])
#   end
#
#   def update
#     if Cat.find(params[:id]).update_attributes(params[:cat])
#       age = Time.now.year - Time.parse(params[:cat][:birthday]).year
#       params[:cat][:age] = age
#       redirect_to cats_url
#     else
#       render :edit
#     end
#   end

end
