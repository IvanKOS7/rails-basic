class TestsController < ApplicationController

  def index
    render json: { tests: Test.all }
  end

  def show
    render json: { test: Test.where('id=?', params[:id]) }
  end


end
