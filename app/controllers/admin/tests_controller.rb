class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:destroy, :edit, :show, :update]


  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    #у меня здесь не было ассоциации, пришлось делать
    #я просто думал использовать старую ассоциацию тестов, она ведь не используется, админ тесты не проходит
    #и автора я просто добавлял как объект relation в тест
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
    params.require(:test).permit(:title, :level, :category_id)
  end

end
