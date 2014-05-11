class RxAlerts::BuildController < ApplicationController
  include Wicked::Wizard
  before_filter :has_pharmacy?
  steps :din, :message, :confirm

  def show
    authenticate_user!
    @user = current_user
    # binding.pry

    case step
    when :din
      @rx_alert = current_user.employable.rx_alerts.build
    end
    render_wizard

    # @rx_alerts = [RxAlert.find(params[:id])]
    # render :index
  end

  # def index
  #   @rx_alerts = RxAlert.new
  #   render_wizard
  # end

  # def new
  #   # authenticate_user!
  #   # if current_user.employable.nil?
  #   #   redirect_to edit_user_registration_path(current_user), flash: {error: 'You must have a pharmacy to create a RX Alert'}
  #   # end
  #   @rx_alert = RxAlert.new
  #   render_wizard
  # end
  def update

  end

  def create
    binding.pry
    @rx_alert = RxAlert.create
    redirect_to wizard_path(steps.first, :rx_alert_id => @rx_alert.id)
    # authenticate_user!
  end

  def destroy
    # authenticate_user!
  end

end
