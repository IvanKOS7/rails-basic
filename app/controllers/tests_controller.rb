class TestsController < ApplicationController

  before_action :find_test, only: [:start]


  def index
    @tests = Test.all
    flash.now[:notice] = "Hello, #{current_user.first_name}"
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

private

  def find_test
    @test = Test.find(params[:id])
  end
end
