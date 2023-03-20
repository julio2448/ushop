class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :coupons, foreign_key: :owner_id, class_name: "Coupon"
  has_many :bookmarks, foreign_key: :client_id, class_name: "Bookmark"
end
