class TcategoriesController < ApplicationController
	before_action :set_tcategory, only: [:show, :edit, :update, :destroy]

  def index
    @tcategories = Tcategory.all
  end

  def show
  end

  def new
    @tcategory = Tcategory.new
  end

  def edit
  end

  def create
    @tcategory = Tcategory.new(tcategory_params)

    respond_to do |format|
      if @tcategory.save
        format.html { redirect_to @tcategory, notice: 'Tcategory was successfully created.' }
        format.json { render :show, status: :created, location: @tcategory }
      else
        format.html { render :new }
        format.json { render json: @tcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tcategory.update(tcategory_params)
        format.html { redirect_to @tcategory, notice: 'Tcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @tcategory }
      else
        format.html { render :edit }
        format.json { render json: @tcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tcategory.destroy
    respond_to do |format|
      format.html { redirect_to tcategories_url, notice: 'Tcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tcategory
      @tcategory = Tcategory.find(params[:id])
    end

    def tcategory_params
      params.require(:tcategory).permit(:title, :description)
    end
end
