class Bookmark < ApplicationRecord
  belongs_to :coupon
  belongs_to :client, class_name: "User"

  def coupon_owner
    self.coupon.owner.email
  end
end
