class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @coupons = Coupon.search_coupon(params[:query])
      # render turbo_stream: turbo_stream.update("coupon_cards", partial: "pages/turbo_frames/coupon_cards", locals: { coupons: @coupons })
    else
      @coupons = Coupon.all
    end

    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        # info_window_html: render_to_string(partial: "pages/marker", locals: { user: user }),
        # marker_html: render_to_string(partial: "marker", locals: { user: user })
      }
    end


    if params[:coupon_id].present?
      puts "hola #{params[:coupon_id]}"
      render turbo_stream: turbo_stream.update("coupon_cards", partial: "coupons/turbo_frames/coupon", locals: { coupon: Coupon.find(params[:coupon_id]) })
    else
      respond_to do |format|
        format.html
        format.text { render partial: "pages/turbo_frames/coupon_cards", locals: { coupons: @coupons }, formats: [:html] }
      end
    end


  end

  def index;
  end
end
