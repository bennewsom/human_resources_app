class LeaveTotalsController < SessionsController
 
   # Show and edit filter for departments
  before_action :get_leave_total, only: [:show, :edit, :update, :destroy]
  
  # GET /leave totals
  def index
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:department_id])
    @employee = Employee.find(params[:employee_id])
    @leave_totals = @employee.leave_totals.paginate(page: params[:page])
  end

  # GET /leave totals/:id
  def show
  end

  # GET /leave totals/new
  def new
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:department_id])
    @employee = Employee.find(params[:employee_id])
    @leave_total = LeaveTotal.new
  end

  # POST /leave totals
  def create
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:department_id])
    @employee = Employee.find(params[:employee_id])
    @leave_total = LeaveTotal.new(white_listed_parameters)
    @leave_total.employee = @employee
    if @leave_total.save
      flash[:notice] = 'Leave Logged'
      redirect_to company_department_employee_leave_totals_path(@company, @department, @employee)
    else
      render :new
    end
  end

  # GET /leave totals/:id/edit
  def edit
  end

  # PUT /leave totals
  def update
    @leave_total.employee = @employee
    if @leave_total.update_attributes(white_listed_parameters)
      flash[:notice] = 'Leave Logged'
      redirect_to company_department_employee_leave_totals_path
    else
      render :edit
    end
  end

  # DELETE /leave totals/:id
  def destroy
    @leave_total.destroy
    redirect_to company_department_employee_leave_totals_path
  end

  private

  # Get's the leave_total from the database, and redirects if unable to find one
  def get_leave_total
    begin
      @company = Company.find(params[:company_id])
      @department = Department.find(params[:department_id])
      @employee = Employee.find(params[:employee_id])
      @leave_total = LeaveTotal.find(params[:id])
    rescue
      redirect_to company_department_employee_leave_totals_path
    end
  end

  # White lists the corresponding parameters
  def white_listed_parameters
    params
    .require(:leave_total)
    .permit(:annual_leave, :sick_leave, :other_leave, :reasons_for_leave, :date_leave_requested)
    .merge(params.permit(:employee_id))
  end
  
  
  def remaining_annual_leave(employee, leave_totals)
        @leave_totals = @employee.leave_totals
        annual_leave_total = 0
        @leave_totals.each do |leave_total|
            annual_leave_total = annual_leave_total + leave_total.annual_leave
        end
        @employee.annual_leave_allowance - annual_leave_total
  end
    
  def remaining_sick_leave(employee, leave_totals)
      @leave_totals = @employee.leave_totals
      sick_leave_total = 0
      leave_totals.each do |leave_total|
          sick_leave_total = sick_leave_total + leave_total.sick_leave
      end
      @employee.sick_leave_allowance - sick_leave_total
  end
    
  def remaining_other_leave(employee, leave_totals)
      @leave_totals = @employee.leave_totals
      other_leave_total = 0
      leave_totals.each do |leave_total|
          other_leave_total = other_leave_total + leave_total.other_leave
      end
      @employee.other_leave_allowance - other_leave_total
  end
  

end
