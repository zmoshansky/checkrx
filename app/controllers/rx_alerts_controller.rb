class RxAlertsController < ApplicationController

  def show

  end

  def index
    @rx_alerts = RxAlert.all
    todays_date = DateTime.now.beginning_of_day
    week_ago_date = todays_date - 7
    #binding.pry
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
    authenticate_user!
  end

  def create
    authenticate_user!
  end

  def destroy
    authenticate_user!
  end
end
