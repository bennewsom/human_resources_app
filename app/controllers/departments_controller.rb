class DepartmentsController < SessionsController
  
  # Show and edit filter for departments
  before_action :get_department, only: [:show, :edit, :update, :destroy]
  
  # GET /departments
  def index
    @departments = Department.paginate(page: params[:page])
  end

  # GET /departments/:id
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # POST /departments
  def create
    @department = Department.new(white_listed_parameters)
    if @department.save
      flash[:notice] = 'Department Created'
      redirect_to departments_path
    else
      render :new
    end
  end

  # GET /departments/:id/edit
  def edit
  end

  # PUT /departments
  def update
    if @department.update_attributes(white_listed_parameters)
      flash[:notice] = 'Department saved'
      redirect_to departments_path
    else
      render :edit
    end
  end

  # DELETE /companys/:id
  def destroy
    @department.destroy
    redirect_to departments_path
  end

  private

  # Get's the company from the database, and redirects if unable to find one
  def get_department
    begin
      @department = Department.find(params[:id])
    rescue
      redirect_to departments_path
    end
  end

  # White lists the corresponding parameters
  def white_listed_parameters
    params
      .require(:department)
      .permit(:department_name, :company_id)
  end

end
