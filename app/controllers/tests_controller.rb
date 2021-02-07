class TestsController < ApplicationController
before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tcategory = Tcategory.includes(:tests)
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

      if @test.save
        redirect_to @test, notice: 'Test was successfully created.'
      else
        render :new 
      end
  end

  def update
      if @test.update(test_params)
        redirect_to @test, notice: 'Test was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:title, :description, :active, :tcategory_id, :certificate, questions_attributes: 
        [:body, :_destroy, :id, answers_attributes: [:body, :_destroy, :id, :isCorrect]])
    end
end
