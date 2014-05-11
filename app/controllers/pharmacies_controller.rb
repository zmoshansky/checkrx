class PharmaciesController < ApplicationController

  def new
    authenticate_user!
    @pharmacy = Pharmacy.new
  end

  def create
    authenticate_user!

    @pharmacy = Pharmacy.new(params[:pharmacy])
    ensure_phone_num_is_numeric(@pharmacy)
    if @pharmacy.save

      unless current_user.employable
        current_user.employable = @pharmacy
        current_user.save # if it fails, NBD
      end

      return redirect_to @pharmacy, {notice: "Welcome!"}
    else
      return render action: "new"
    end
  end

  def show
    authenticate_user!
    @pharmacy = Pharmacy.find(params[:id])
    unless @pharmacy
      return render action: "index", notice: "Pharmacy not found"
    end
    binding.pry
  end

  def index
    authenticate_user!
    @pharmacies = Pharmacy.all
  end

  def destroy
    authenticate_user!
    @pharmacy = Pharmacy.find(params[:id])
    unless @pharmacy
      return render action: "index", notice: "Pharmacy not found"
    end
    @pharmacy.destroy
    return render action: "index"
  end

  private
  
  def ensure_phone_num_is_numeric(pharm)
    return if pharm.phone.class == Fixnum

    begin
      num = pharm.phone
      num_str = num.to_s
      digits_only = num.gsub(/[^\d]/, '')
      digits_only_as_num = num.to_i
      pharm.phone = digits_only_as_num
    rescue
      pharm.phone = num
    end
  end
end
