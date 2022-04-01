class TestsController < ApplicationController

  before_action :find_test, only: [:start]


  def index
    @tests = Test.all
    #flash.now[:notice] = t(:hello_flash)
  end

  def start
    if @test.questions.empty?

      redirect_to tests_path
      flash.now[:alert] = "Could't start test without questions"
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end
  end

private

  def find_test
    @test = Test.find(params[:id])
  end
end
