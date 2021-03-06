class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: [:new, :index, :create]
  before_action :find_question, only: [:update, :edit, :show, :destroy]


  def index
    @test_questions = @test.questions
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@test), notice: "Question successfuly created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test), notice: "Question successfuly updated"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test]
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
