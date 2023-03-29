# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def new
    if params[:coupon_id].present?
      store_location_for(:user, root_path(coupon_id: params[:coupon_id]))
      super
    else
      super
    end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
end
