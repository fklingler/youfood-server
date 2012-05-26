class ZonesController < ApplicationController
  respond_to :html

  def index
    restaurant = Restaurant.find_by_slug(params[:restaurant_id])
    @zones = restaurant.zones

    respond_with restaurant, @zones
  end

  def show
    @zone = Zone.find_by_slug(params[:id])

    respond_with @zone.restaurant, @zone
  end

  def new
    @zone = Zone.new

    respond_with @zone.restaurant,@zone
  end

  def edit
    @zone = Zone.find_by_slug(params[:id])

    respond_with @zone.restaurant, @zone
  end

  def create
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).new_zone(params[:zone])

    if @zone.save  
      flash[:notice] = "Successfully created zone."  
    end 

    respond_with @zone.restaurant, @zone
  end

  def update
    @zone = Zone.find_by_slug(params[:id])

    if @zone.update_attributes(params[:zone])
      flash[:notice] = "Successfully updated zone."  
    end

    respond_with @zone.restaurant, @zone
  end

  def destroy
    @zone = Zone.find_by_slug(params[:id])
    @zone.destroy

    flash[:notice] = "Successfully destroyed zone."

    respond_with @zone.restaurant, @zone
  end
end
