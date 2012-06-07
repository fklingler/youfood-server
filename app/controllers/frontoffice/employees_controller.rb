class Frontoffice::EmployeesController < Frontoffice::FrontofficeController
  def index
    @employees = Employee.all

    respond_with :frontoffice, @employees
  end

  def show
    @employee = Employee.find_by_slug(params[:id])

    respond_with :frontoffice, @employee
  end

  def new
    @employee = Employee.new

    respond_with :frontoffice, @employee
  end

  def edit
    @employee = Employee.find_by_slug(params[:id])

    respond_with :frontoffice, @employee
  end

  def create
    @employee = Employee.new(params[:employee])

    if @employee.save  
      flash[:notice] = "Successfully created employee."  
    end 

    respond_with :frontoffice, @employee
  end

  def update
    @employee = Employee.find_by_slug(params[:id])

    if @employee.update_attributes(params[:employee])
      flash[:notice] = "Successfully updated employee."  
    end

    respond_with :frontoffice, @employee
  end

  def destroy
    @employee = Employee.find_by_slug(params[:id])

    if @employee.is_admin
      flash[:error] = "Cannot destroy admin employee."

      respond_with :frontoffice, @employee, :location => frontoffice_employees_url
    else
      @employee.destroy

      flash[:notice] = "Successfully destroyed employee."

      respond_with :frontoffice, @employee
    end
  end
end
