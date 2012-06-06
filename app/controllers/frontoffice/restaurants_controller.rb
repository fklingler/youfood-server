class Frontoffice::RestaurantsController < Frontoffice::FrontofficeController
  def index
    @restaurants = Restaurant.all

    respond_with :frontoffice, @restaurants
  end

  def show
    @restaurant = Restaurant.find_by_slug(params[:id])

    respond_with :frontoffice, @restaurant
  end

  def new
    @restaurant = Restaurant.new

    respond_with :frontoffice, @restaurant
  end

  def edit
    @restaurant = Restaurant.find_by_slug(params[:id])

    respond_with :frontoffice, @restaurant
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])

    if @restaurant.save  
      flash[:notice] = "Successfully created restaurant."  
    end 

    respond_with :frontoffice, @restaurant
  end

  def update
    @restaurant = Restaurant.find_by_slug(params[:id])

    if @restaurant.update_attributes(params[:restaurant])
      flash[:notice] = "Successfully updated restaurant."  
    end

    respond_with :frontoffice, @restaurant
  end

  def destroy
    @restaurant = Restaurant.find_by_slug(params[:id])
    @restaurant.destroy

    flash[:notice] = "Successfully destroyed restaurant."

    respond_with :frontoffice, @restaurant
  end
end
