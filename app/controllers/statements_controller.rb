class StatementsController < ApplicationController
	#before_action :set_statement, only: [:show]

  def index
    @statement = Statement.check_statement(params[:check_id])
  end

  def show

    #fonts = CombinePDF.new("#{Rails.root}/app/assets/images/font.pdf").fonts(true)
    
    #CombinePDF.register_font_from_pdf_object :time_new_roman, fonts[0]

  end

  # GET /statements/new
  def new
    @statement = Statement.new()
    @test = params[:test_id]
  end

  # POST /statements
  # POST /statements.json
  def create
    @statement = Statement.new(statement_params)
    @test = @statement.test.id

    path_to_file = "#{Rails.root}/app/assets/images/cert#{@statement.id}.pdf"

    pdf = CombinePDF.load "#{@statement.test.certificate.path}" 

    if !pdf.pages.empty?

          #a = "Привет".encode("UTF-8")

      # create a textbox and add it to the existing pdf on page 2 #{@statement.fio} #{@statement.position} 
          pdf.pages[0].textbox @statement.position, height: 60, width: 450, y: 400, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
          pdf.pages[0].textbox @statement.place, height: 60, width: 450, y: 380, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
        #Суспеснкого районе г . Казани ниже
          pdf.pages[0].textbox @statement.phone, height: 60, width: 450, y: 360, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
          pdf.pages[0].textbox @statement.name, height: 60, width: 450, y: 320, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 35
          pdf.pages[0].textbox @statement.fio, height: 60, width: 450, y: 280, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 35
      # output the new pdf which now contains your dynamic data
          pdf.save path_to_file
          File.open(path_to_file) do |f|
            @statement.certificate = f
          end
          File.delete(path_to_file) if File.exist?(path_to_file)
  end

    respond_to do |format|
      if @statement.save
        format.html { redirect_to root_path, notice: 'Statement was successfully created.' }
      else
        format.html { render :new}
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def statement_params
      params.require(:statement).permit(:email, :name, :soname, :father_name, :position, :place, :test_id, :check_id)
    end
end
