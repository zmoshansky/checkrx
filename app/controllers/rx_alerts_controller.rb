class RxAlertsController < ApplicationController

  def show
    # binding.pry
    if params[:id] == 'building'
      if has_pharmacy?
        return redirect_to action: 'create'
      end
    else
      @rx_alerts = [RxAlert.find(params[:id])]
      render :index
    end
  end

  def index
    # binding.pry
    @rx_alerts = RxAlert.all
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
    # authenticate_user!
    # if current_user.employable.nil?
    #   redirect_to edit_user_registration_path(current_user), flash: {error: 'You must have a pharmacy to create a RX Alert'}
    # end
    # @rx_alert = RxAlert.new
  end

  def create
    # authenticate_user!
  end

  def destroy
    # authenticate_user!
  end
end
