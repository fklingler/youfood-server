class Frontoffice::ZonesController < Frontoffice::FrontofficeController
  def index
    @restaurant = Restaurant.find_by_slug(params[:restaurant_id])
    @zones = @restaurant.zones

    respond_with :frontoffice, @restaurant, @zones
  end

  def show
    @zone = Zone.find_by_slug(params[:id])

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def new
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.new

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def edit
    @zone = Zone.find_by_slug(params[:id])

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def create
    @zone = Restaurant.find_by_slug(params[:restaurant_id]).zones.new(params[:zone])

    if @zone.save  
      flash[:notice] = "Successfully created zone."  
    end 

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def update
    @zone = Zone.find_by_slug(params[:id])

    if @zone.update_attributes(params[:zone])
      flash[:notice] = "Successfully updated zone."  
    end

    respond_with :frontoffice, @zone.restaurant, @zone
  end

  def destroy
    @zone = Zone.find_by_slug(params[:id])
    @zone.destroy

    flash[:notice] = "Successfully destroyed zone."

    respond_with :frontoffice, @zone.restaurant, @zone
  end
end
