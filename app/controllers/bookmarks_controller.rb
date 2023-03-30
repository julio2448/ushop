class BookmarksController < ApplicationController
  before_action :set_coupon, only: :create
  before_action :authenticate_user!, only: [:destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def my_bookmarks
    if current_user
      @my_bookmarks = current_user.bookmarks
    else
      flash[:alert] = 'You need to sign in'
      redirect_to new_user_session_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to my_bookmarks_path
  end

  def create
    p "hola from create"
    @bookmark = Bookmark.new(coupon_id: @coupon.id, client_id: current_user.id)
    @bookmark.save!

    redirect_to my_bookmarks_path
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:coupon_id])
  end
end
