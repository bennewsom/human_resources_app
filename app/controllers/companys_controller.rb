class CompanysController < SessionsController
  
  # Show and edit filter for companys
  before_action :get_company, only: [:show, :edit, :update, :destroy]
  
# GET /companys
  def index
    @companys = Company.paginate(page: params[:page])
  end

  # GET /companys/:id
  def show
  end

  # GET /companys/new
  def new
    @company = Company.new
  end

  # POST /companys
  def create
    @company = Company.new(white_listed_parameters)
    if @company.save
      flash[:notice] = 'Company Created'
      redirect_to companys_path
    else
      render :new
    end
  end

  # GET /companys/:id/edit
  def edit
  end

  # PUT /companys
  def update
    if @company.update_attributes(white_listed_parameters)
      flash[:notice] = 'Company saved'
      redirect_to companys_path
    else
      render :edit
    end
  end

  # DELETE /companys/:id
  def destroy
    @company.destroy
    redirect_to companys_path
  end

  private

  # Get's the company from the database, and redirects if unable to find one
  def get_company
    begin
      @company = Company.find(params[:id])
    rescue
      redirect_to companys_path
    end
  end

  # White lists the corresponding parameters
  def white_listed_parameters
    params
      .require(:company)
      .permit(:compname)
  end
end
