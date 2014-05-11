class RxAlertsController < ApplicationController

  def show

  end

  def index
    @rx_alerts = RxAlert.all
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
