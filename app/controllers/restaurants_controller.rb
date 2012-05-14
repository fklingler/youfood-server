class RestaurantsController < ApplicationController
  respond_to :html

  def index
    @restaurants = Restaurant.all

    respond_with @restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    respond_with @restaurant
  end

  def new
    @restaurant = Restaurant.new

    respond_with @restaurant
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

    respond_with @restaurant
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])

    if @restaurant.save  
      flash[:notice] = "Successfully created restaurant."  
    end 

    respond_with @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(params[:restaurant])
      flash[:notice] = "Successfully updated restaurant."  
    end

    respond_with @restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    flash[:notice] = "Successfully destroyed restaurant."

    respond_with @restaurant
  end
end
