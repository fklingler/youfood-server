class Frontoffice::ProductsController < Frontoffice::FrontofficeController
  def index
    @products = Product.all

    respond_with :frontoffice, @products
  end

  def show
    @product = Product.find_by_slug(params[:id])

    respond_with :frontoffice, @product
  end

  def new
    @product = Product.new

    respond_with :frontoffice, @product
  end

  def edit
    @product = Product.find_by_slug(params[:id])

    respond_with :frontoffice, @product
  end

  def create
    @product = Product.new(params[:product])

    if @product.save  
      flash[:notice] = "Successfully created product type."  
    end 

    respond_with :frontoffice, @product
  end

  def update
    @product = Product.find_by_slug(params[:id])

    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product type."  
    end

    respond_with :frontoffice, @product
  end

  def destroy
    @product = Product.find_by_slug(params[:id])
    @product.destroy

    flash[:notice] = "Successfully destroyed product type."

    respond_with :frontoffice, @product
  end
end
