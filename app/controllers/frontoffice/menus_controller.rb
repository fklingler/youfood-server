class Frontoffice::MenusController < Frontoffice::FrontofficeController
  before_filter :authenticate_employee!

  def index
    @menus = Menu.all

    respond_with :frontoffice, @menus
  end

  def show
    @menu = Menu.find_by_slug(params[:id])

    respond_with :frontoffice, @menu
  end

  def new
    @menu = Menu.new

    respond_with :frontoffice, @menu
  end

  def edit
    @menu = Menu.find_by_slug(params[:id])

    respond_with :frontoffice, @menu
  end

  def create
    @menu = Menu.new(params[:menu])

    if @menu.save  
      flash[:notice] = "Successfully created menu."  
    end 

    respond_with :frontoffice, @menu
  end

  def update
    @menu = Menu.find_by_slug(params[:id])

    if @menu.update_attributes(params[:menu])
      flash[:notice] = "Successfully updated menu."  
    end

    respond_with :frontoffice, @menu
  end

  def destroy
    @menu = Menu.find_by_slug(params[:id])
    @menu.destroy

    flash[:notice] = "Successfully destroyed menu."

    respond_with :frontoffice, @menu
  end
end
