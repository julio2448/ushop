class CouponsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

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

  def my_coupons
    if current_user
      @my_coupons = current_user.coupons
    else
      flash[:alert] = 'You need to sign in'
      redirect_to new_user_session_path
    end
  end

  def create
    @coupon = Coupon.new(coupon_params)
    @coupon.owner = current_user
    @coupon.availibility = true
    if @coupon.save
      redirect_to @coupon
    else
      render "coupons/new", status: :unprocessable_entity
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to coupons_path
  end

  private

  def coupon_params
    params.require(:coupon).permit(:title, :availibility, :start_time, :end_time, :product_name, :product_description, :code)
  end
end
