class QuestionsController < ApplicationController

  before_action :find_test, only: %[index, create, destroy, destroyed]

  def index
      render json: { test_questions: @test.questions }
  end

  def show
    begin
    render json: { questions: Question.find(params[:id]) }
    rescue => e
      render plain: "Couldn't find Question"
    end
  end

  def all_questions
    render json: { all_questions: Question.all }
  end

  def create
    @params = params
    @new_test_question = @test.questions.create(body: params[:body]).save
    render "questions/create"
  end

  def destroy
    render "questions/destroy"
  end

  def destroyed
    @destroy_question = Question.find(params[:id]).destroy
    render "questions/destroy"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

end
