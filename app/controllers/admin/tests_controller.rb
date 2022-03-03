class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:destroy, :edit, :show, :update, :start]


  def index
    @tests = Test.all
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests.push(Test.new(test_params))
    redirect_to admin_tests_path
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end
private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, author: current_user)
  end

end
