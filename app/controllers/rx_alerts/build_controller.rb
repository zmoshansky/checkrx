class RxAlerts::BuildController < ApplicationController
  include Wicked::Wizard
  before_filter :has_pharmacy?
  steps :din, :message, :confirm

  def show
    authenticate_user!
    @rx_alert = RxAlert.find(params[:rx_alert_id])
    render_wizard
  end

  def update
    @rx_alert = RxAlert.find(params[:rx_alert_id])
    params.delete(params[:rx_alert_id])
    @rx_alert.update_attributes(params[:rx_alert])
    @rx_alert.update_attributes(availability: params[:availability]) if params[:availability]
    if @rx_alert.set_name!.nil?
      redirect_to wizard_path(step, rx_alert_id: @rx_alert.id)
    else
      redirect_to wizard_path(next_step, rx_alert_id: @rx_alert.id)
    end
  end

  def index
    create
  end

  def create
    authenticate_user!
    @rx_alert = current_user.employable.rx_alerts.create
    redirect_to wizard_path(steps.first, rx_alert_id: @rx_alert.id)
  end

  def destroy
    # authenticate_user!
  end

  def finish_wizard_path
    RxAlert.find(params[:rx_alert_id]).mark_complete!
    rx_alert_path(params[:rx_alert_id])
  end
end
