class AdminstudrecsController < ApplicationController
  before_action :set_adminstudrec, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:show, :edit, :update, :destroy, :import_from_excel]
  # GET /adminstudrecs
  # GET /adminstudrecs.json
  def index
    @adminstudrecs = Adminstudrec.all
  end

  # GET /adminstudrecs/1
  # GET /adminstudrecs/1.json
  def show
  end

  # GET /adminstudrecs/new
  def new
    @adminstudrec = Adminstudrec.new
  end

  # GET /adminstudrecs/1/edit
  def edit
  end

  # POST /adminstudrecs
  # POST /adminstudrecs.json
  def create
    @adminstudrec = Adminstudrec.new(adminstudrec_params)

    respond_to do |format|
      if @adminstudrec.save
        format.html { redirect_to @adminstudrec, notice: 'Adminstudrec was successfully created.' }
        format.json { render :show, status: :created, location: @adminstudrec }
      else
        format.html { render :new }
        format.json { render json: @adminstudrec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminstudrecs/1
  # PATCH/PUT /adminstudrecs/1.json
  def update
    respond_to do |format|
      if @adminstudrec.update(adminstudrec_params)
        format.html { redirect_to @adminstudrec, notice: 'Adminstudrec was successfully updated.' }
        format.json { render :show, status: :ok, location: @adminstudrec }
      else
        format.html { render :edit }
        format.json { render json: @adminstudrec.errors, status: :unprocessable_entity }
      end
    end
  end
  def import_from_excel
     file = params[:file]
     puts "file is"
     puts file
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      puts "byee"
      ## We are iterating from row 2 because we have left row one for header
      (2..spreadsheet.last_row).each do |i|
        Adminstudrec.create(name: spreadsheet.row(i)[0], uin: spreadsheet.row(i)[1], email: spreadsheet.row(i)[2], classcode: spreadsheet.row(i)[3], major: spreadsheet.row(i)[4] )
      end
    flash[:notice] = "Records Imported"
    redirect_to '/addcohort'
    rescue Exception => e
    flash[:notice] = "Issues with file"
    redirect_to '/addcohort'
    end
  end
    
  # DELETE /adminstudrecs/1
  # DELETE /adminstudrecs/1.json
  def destroy
    @adminstudrec.destroy
    respond_to do |format|
      format.html { redirect_to adminstudrecs_url, notice: 'Adminstudrec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminstudrec
      @adminstudrec = Adminstudrec.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adminstudrec_params
      params.require(:adminstudrec).permit(:name, :uin, :email, :classcode, :major)
    end
end
