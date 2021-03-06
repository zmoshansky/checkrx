class RxAlertsController < ApplicationController

  def my_alerts
    @rx_alerts = RxAlert.all.find_all{ |a| a.pharmacy == current_user.employable }
    @title = 'My Alerts'
    todays_date = DateTime.now.beginning_of_day
    week_ago_date = todays_date - 7
    @todays_alerts = @rx_alerts.find_all do |alert|
      alert.updated_at > todays_date
    end
    @last_week_alerts = @rx_alerts.find_all do |alert|
      alert.updated_at <= todays_date and alert.updated_at > week_ago_date
    end
    @older_alerts = @rx_alerts.find_all do |alert|
      alert.updated_at < week_ago_date
    end

    render :index
  end

  def show
    if params[:id] == 'building'
      if has_pharmacy?
        redirect_to '/rx_alerts_builder'
      end
    else
      @rx_alert = RxAlert.find(params[:id])
    end
  end

  def change_to_available
    @rx_alert = RxAlert.find(params[:id])
    @rx_alert.update_attributes(availability: 'avail')
    redirect_to rx_alerts_path
  end

  def edit
    @rx_alert = RxAlert.find(params[:id])
  end

  def update
    @rx_alert = RxAlert.find(params[:id])
    # @rx_alert.mark_complete!
    flash[notice: 'Rx Alert Created']
    render :show
  end

  def index
    @rx_alerts = RxAlert.all
    @title = 'Recent Alerts'

    todays_date = DateTime.now.beginning_of_day
    week_ago_date = todays_date - 7
    @todays_alerts = @rx_alerts.find_all do |alert|
      alert.updated_at > todays_date
    end
    @last_week_alerts = @rx_alerts.find_all do |alert|
      alert.updated_at <= todays_date and alert.updated_at > week_ago_date
    end
    @older_alerts = @rx_alerts.find_all do |alert|
      alert.updated_at < week_ago_date
    end
  end

  def new
    redirect_to '/rx_alerts_builder'
  end

  def create
    new
  end

  def destroy
    # authenticate_user!
  end
end
