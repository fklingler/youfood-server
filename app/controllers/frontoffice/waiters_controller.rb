class Frontoffice::WaitersController < Frontoffice::FrontofficeController
  def index
    @restaurant = Restaurant.find_by_slug(params[:restaurant_id])
    @waiters = @restaurant.waiters

    respond_with :frontoffice, @restaurant, @waiters
  end

  def show
    @waiter = Restaurant.find_by_slug(params[:restaurant_id]).waiters.find_by_slug(params[:id])

    respond_with :frontoffice, @waiter.restaurant, @waiter
  end

  def new
    @waiter = Restaurant.find_by_slug(params[:restaurant_id]).waiters.new

    respond_with :frontoffice, @waiter.restaurant, @waiter
  end

  def edit
    @waiter = Restaurant.find_by_slug(params[:restaurant_id]).waiters.find_by_slug(params[:id])

    respond_with :frontoffice, @waiter.restaurant, @waiter
  end

  def create
    @waiter = Restaurant.find_by_slug(params[:restaurant_id]).waiters.new(params[:waiter])
    @waiter.create_device
    zone = Zone.find(params[:waiter][:zone])

    if @waiter.save && zone.update_attributes(waiter: @waiter)
      flash[:notice] = "Successfully created waiter."  
    end 

    respond_with :frontoffice, @waiter.restaurant, @waiter
  end

  def update
    @waiter = Restaurant.find_by_slug(params[:restaurant_id]).waiters.find_by_slug(params[:id])
    zone = Zone.find(params[:waiter][:zone])

    if @waiter.update_attributes(params[:waiter]) && zone.update_attributes(waiter: @waiter)
      flash[:notice] = "Successfully updated waiter."  
    end

    respond_with :frontoffice, @waiter.restaurant, @waiter
  end

  def destroy
    @waiter = Restaurant.find_by_slug(params[:restaurant_id]).waiters.find_by_slug(params[:id])
    @waiter.destroy

    flash[:notice] = "Successfully destroyed waiter."

    respond_with :frontoffice, @waiter.restaurant, @waiter
  end
end
