class EmployeesController < SessionsController
  
   # Show and edit filter for departments
  before_action :get_employee, only: [:show, :edit, :update, :destroy]
  
  # GET /employees
  def index
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:department_id])
    @employees = @department.employees.paginate(page: params[:page])
  end

  # GET /employees/:id
  def show
    @department = Department.find(params[:department_id])
  end

  # GET /employees/new
  def new
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:department_id])
    @employee = Employee.new
  end

  # POST /employees
  def create
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:department_id])
    @employee = Employee.new(white_listed_parameters)
    if @employee.save
      flash[:notice] = 'Employee Created'
      redirect_to company_department_employees_path(@company, @department)
    else
      render :new
    end
  end

  # GET /employees/:id/edit
  def edit
  end

  # PUT /employees
  def update
    if @employee.update_attributes(white_listed_parameters)
      flash[:notice] = 'Employee saved'
      redirect_to company_department_employees_path
    else
      render :edit
    end
  end

  # DELETE /employees/:id
  def destroy
    @employee.destroy
    flash[:notice] = 'Employee Deleted'
    redirect_to company_department_employees_path
  end

  private

  # Get's the company from the database, and redirects if unable to find one
  def get_employee
    begin
      @company = Company.find(params[:company_id])
      @department = Department.find(params[:department_id])
      @employee = Employee.find(params[:id])
    rescue
      redirect_to company_department_employees_path
    end
  end

  # White lists the corresponding parameters
  def white_listed_parameters
    params
    .require(:employee)
    .permit(:first_name, :last_name, :start_date, :position_title, :gender, :date_of_birth, 
    :address, :suburb, :state, :postcode, :home_phone, :mobile, :email, :tax_file_number, 
    :nok_name, :nok_relationship, :nok_address, :nok_suburb, :nok_state, :nok_postcode,
    :nok_home_phone, :nok_mobile, :nok_work_phone, :employee_hire_date, :employment_status,
    :annual_pay, :monthly_pay, :hourly_rate, :benefits, :bank_name, :bank_branch, :account_name,
    :bsb_number, :account_number, :tax_dec_form, :super_form, :it_licences, :employee_photo, :business_card,
    :annual_leave_allowance, :sick_leave_allowance, :other_leave_allowance,  :country , :nok_country)
    .merge(params.permit(:department_id))
  end

end
