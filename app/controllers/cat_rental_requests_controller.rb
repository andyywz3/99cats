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

  def update

    @rental_request = CatRentalRequest.find(params[:id])

          if params[:request][:status] == "approved"
            @rental_request.approve
            redirect_to cat_rental_requests_url
          else
            @rental_request.update_attributes(params[:request])
            @rental_request.save!
            redirect_to cats_url
          end
      end
end
