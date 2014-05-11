class SearchController < ApplicationController

  def search
    q = "%#{params[:search]}%"
    @rx_alerts = RxAlert.where("din like ?", q).find_all{ |a| a.build_status == 'complete'}
    if @rx_alerts.blank?
      @rx_alerts = RxAlert.where("brand_name like ? or din like ?", q, q).find_all{ |a| a.build_status == 'complete'}
    end
    @title = 'Search Results'

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

    render 'rx_alerts/index'
  end
end
