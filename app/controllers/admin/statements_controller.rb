class Admin::StatementsController < ApplicationController
	before_action :set_statement, only: [:show, :edit, :update, :destroy]

  def index
    @statements = Statement.find_statement(params[:search])
  end

  def show
    #some

  end

  def edit
  end

  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html { redirect_to @statement, notice: 'Statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @statement }
      else
        format.html { render :edit }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statements/1
  # DELETE /statements/1.json
  def destroy
    @statement.destroy
    respond_to do |format|
      format.html { redirect_to admin_statements_url, notice: 'Statement was successfully destroyed.' }

    end
  end

  def update_certificate
    @statement = Statement.find(params[:id])
    @statement.certificate.remove!
    path_to_file = "#{Rails.root}/app/assets/images/cert#{@statement.id}.pdf"
    pdf = CombinePDF.load "#{@statement.test.certificate.path}"

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
    
    if @statement.save
      redirect_to @statement
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def statement_params
      params.require(:statement).permit(:email, :name, :soname, :father_name, :position, :place, :test_id, :notified, :paid, :certificate, {search: [:paid, 
                                                                                                     :email, :fio, :ticket_id,{date: [:start, :end]}]})
    end
end
