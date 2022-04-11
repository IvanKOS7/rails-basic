class Admin::BadgesController < Admin::BaseController
  before_action :find_tests, only: :create
      before_action :find_badge, only: [:show, :edit, :update, :destroy]
    before_action :set_badge, only: [:index, :edit, :update]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
      @badge = Badge.new(badge_params)
      shield_service = ShieldsService.new(badge_params)
      response = shield_service.call
    if @badge.save
      @badge.update(full_url: response.env.url)
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
  end


  def update
    shield_service = ShieldsService.new(badge_params)
    response = shield_service.call
    #byebug
    if @badge.update(badge_params)
      @badge.update(full_url: response.env.url)
      #@tests.badges&.push(@badge)
      redirect_to edit_admin_badge_path
    else
      render :edit
    end
  end


  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end


  private

  def find_tests
    @tests = Test.all
  end

  def set_badge
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :color, :label, :message, :badge_type)
  end

end
