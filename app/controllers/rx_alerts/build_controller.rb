class RxAlerts::BuildController < ApplicationController
  include Wicked::Wizard
  before_filter :has_pharmacy?
  steps :din, :message, :confirm

  def show
    authenticate_user!
    # binding.pry
    # binding.pry
    @rx_alert = RxAlert.find(params[:rx_alert_id])
    # case step
    # when :din
    #   @rx_alert = current_user.employable.rx_alerts.create
    # when :message
    #   return redirect_to wizard_path(steps.first) if @rx_alert.nil?
    # end
    render_wizard

    # @rx_alerts = [RxAlert.find(params[:id])]
    # render :index
  end

  def update
    binding.pry
    @rx_alert = rx_alert.find(params[:rx_alert_id])
    @rx_alert.update_attributes(params[:rx_alert])
    render_wizard @rx_alert
  end

  def index
    create
  end

  def create
    authenticate_user!
    @rx_alert = current_user.employable.rx_alerts.create
    redirect_to wizard_path(steps.first, :rx_alert_id => @rx_alert.id)
  end

  def destroy
    # authenticate_user!
  end

end
