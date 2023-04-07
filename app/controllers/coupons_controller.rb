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
    if current_user
      @coupon = Coupon.new
    else
      flash[:alert] = 'You need to sign in'
      redirect_to new_user_session_path
    end
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
    attach_ai_image_to_coupon if params[:coupon][:ai_image] == true
    if @coupon.save
      redirect_to @coupon
    else
      render "coupons/new", status: :unprocessable_entity
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to root_path
  end

  private

  def coupon_params
    params.require(:coupon).permit(:title, :availibility, :start_time, :end_time, :product_name, :product_description, :code, :photo, :address, :ai_image)
  end

  def attach_ai_image_to_coupon
    image = dalle_service.content_image(@coupon)
    @coupon.photo.attach(io: URI.open(image), filename: 'image.jpg', content_type: 'image/jpg')
  end

  def dalle_service
    client = OpenAI::Client.new
    @dalle_service ||= DalleService.new(client)
  end
end
