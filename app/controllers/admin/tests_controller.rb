class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: [:index, :update_inline, :public_test]
  before_action :find_test, only: [:destroy, :edit, :show, :update, :update_inline, :public_test]


  def index
    @tests = Test.all.sort
  end

  def show
  end

  def new
    @test = Test.new
  end

  def public_test
    if @test.questions.empty? || @test.questions.any? {|q| q.answers.empty? }
      redirect_to admin_tests_path, alert: "Unpublished"
    else
      @test.update(test_params)
      redirect_to admin_tests_path, notice: "Successfuly published"
    end
  end


  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :published)
  end

end
