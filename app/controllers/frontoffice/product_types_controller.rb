class Frontoffice::ProductTypesController < Frontoffice::FrontofficeController
  def index
    @product_types = ProductType.all

    respond_with @product_types
  end

  def show
    @product_type = ProductType.find_by_slug(params[:id])

    respond_with @product_type
  end

  def new
    @product_type = ProductType.new

    respond_with @product_type
  end

  def edit
    @product_type = ProductType.find_by_slug(params[:id])

    respond_with @product_type
  end

  def create
    @product_type = ProductType.new(params[:product_type])

    if @product_type.save  
      flash[:notice] = "Successfully created product type."  
    end 

    respond_with @product_type
  end

  def update
    @product_type = ProductType.find_by_slug(params[:id])

    if @product_type.update_attributes(params[:product_type])
      flash[:notice] = "Successfully updated product type."  
    end

    respond_with @product_type
  end

  def destroy
    @product_type = ProductType.find_by_slug(params[:id])
    @product_type.destroy

    flash[:notice] = "Successfully destroyed product type."

    respond_with @product_type
  end
end
