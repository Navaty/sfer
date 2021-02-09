class SurveysController < ApplicationController
	def new
	    #@survey = Survey.new
	    @test = Test.find(params[:test_id])
  	end

  	def create
	  	# @survey = Survey.new()
	    @test = params[:test_id]
	    @score = 0
	    @wrong_questions = Array.new
	    @wrong_answers = Array.new
	    @total = 0
	    @survey = params[:survey]
	    if !@survey.nil?
	      @survey.each do |a, b|
	        @total += 1
	        answer = Answer.find(b)
	        if(answer.isCorrect)
	          @score += 1
	        else
	          @wrong_questions << Question.find(a)
	          @wrong_answers << b.to_i
	        end
	      end
	    end
	    summary = @score.to_f/@total*100
	    if summary <70
	      render :loser
	    else
	      @statement = Statement.new
	      redirect_to new_test_statement_path(@test)
	    end	
  	end
end
