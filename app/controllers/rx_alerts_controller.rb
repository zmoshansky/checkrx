class RxAlertsController < ApplicationController

  def show

  end

  def index
    @rx_alerts = RxAlert.all
  end

  def create

  end

  def destroy

  end
end
