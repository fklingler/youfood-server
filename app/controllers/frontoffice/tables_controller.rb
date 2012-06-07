class Frontoffice::TablesController < Frontoffice::FrontofficeController
  def index
    @restaurant = Restaurant.find_by_slug(params[:restaurant_id])
    @tables = @restaurant.tables

    respond_with :frontoffice, @restaurant, @tables
  end

  def show
    @table = Table.find_by_slug(params[:id])

    respond_with :frontoffice, @table.restaurant, @table
  end

  def new
    @table = Restaurant.find_by_slug(params[:restaurant_id]).tables.new

    respond_with :frontoffice, @table.restaurant, @table
  end

  def edit
    @table = Table.find_by_slug(params[:id])

    respond_with :frontoffice, @table.restaurant, @table
  end

  def create
    @table = Restaurant.find_by_slug(params[:restaurant_id]).tables.new(params[:table])
    @table.create_device

    if @table.save  
      flash[:notice] = "Successfully created table."  
    end 

    respond_with :frontoffice, @table.restaurant, @table
  end

  def update
    @table = Table.find_by_slug(params[:id])

    if @table.update_attributes(params[:table])
      flash[:notice] = "Successfully updated table."  
    end

    respond_with :frontoffice, @table.restaurant, @table
  end

  def destroy
    @table = Table.find_by_slug(params[:id])
    @table.destroy

    flash[:notice] = "Successfully destroyed table."

    respond_with :frontoffice, @table.restaurant, @table
  end
end
