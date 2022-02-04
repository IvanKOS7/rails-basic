class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]


  def index
    render json: { test_questions: @test.questions }
  end

  def show
    render json: { questions: Question.all }
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to action: "index"
    else
       render plain: "Invalid params"
    end
  end

  def destroy
    destroy_question = @question.destroy(params[:id])
    if question.destroy
      render plain: "OK"
    else
      render plain: "NO"
    end
  end


  private

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def question_params
    #permit
     params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
