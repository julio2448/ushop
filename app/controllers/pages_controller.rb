class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @coupons = Coupon.all.sample(2)
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "pages/marker", locals: { user: user }),
        marker_html: render_to_string(partial: "marker", locals: { user: user })
      }
    end
  end

  def index; end
end
