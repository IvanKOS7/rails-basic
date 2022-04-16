class Admin::TimersController < Admin::BaseController


  before_action :find_test, only: [:new, :create]
  before_action :find_timer, only: [:edit, :update, :destroy]

  def new
    @timer = Timer.new

  end

  def create
    @timer = Timer.new(timer_params)

    @test.timer = @timer
    if @timer.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @timer.update(timer_params)
      redirect_to admin_tests_path
    else
      redirect_to admin_tests_path, alert: "Something wrong"
    end
  end

  def destroy
    @timer.destroy
    redirect_to admin_tests_path
  end


  private


  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_timer
    @timer = Timer.find(params[:id])
  end

  def timer_params
    params.require(:test).permit(:timer_value)
  end
end
