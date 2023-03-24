class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :coupons, foreign_key: :owner_id, class_name: "Coupon", dependent: :destroy
  has_many :bookmarks, foreign_key: :client_id, class_name: "Bookmark", dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :customers, -> { where(role: "customer") }
  scope :owners, -> { where(role: "business") }

  def coupon_taken?(coupon)
    bookmarks.map(&:coupon_id).include?(coupon.id)
  end

  def customer?
    role == "customer"
  end
end
