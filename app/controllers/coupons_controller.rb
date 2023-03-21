class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])
    @coupon.update(coupon_params)
    redirect_to coupon_path(@coupon)
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    @coupon.owner = current_user
    @coupon.availibility = true
    if @coupon.save
      redirect_to @coupon
    else
      render "coupons/new"
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to coupons_path
  end

  private

  def coupon_params
    params.require(:coupon).permit(:title, :availibility, :start_time, :end_time, :product_name, :product_description)
  end
end
