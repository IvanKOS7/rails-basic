class Admin::BadgesController < Admin::BaseController
      before_action :find_badge, only: [:show, :edit, :update]
    before_action :set_badge, only: [:index, :edit, :update]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
  end


  def update
    shield_service = ShieldsService.new(badge_params)
    response = shield_service.call
    #byebug
    if @badge.update(badge_params)
      @badge.update(full_url: response.env.url)
      redirect_to edit_admin_badge_path
    else
      render :edit
    end
  end


  private

  def set_badge
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :color, :label, :message)
  end

end
