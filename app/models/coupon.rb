class Coupon < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookmarks, dependent: :destroy
  validates :title, :start_time, :end_time, :product_name, :product_description, :code, presence: true
  validates_comparison_of :end_time, greater_than_or_equal_to: :start_time
  validates_comparison_of :start_time, greater_than_or_equal_to: Date.today

  def available?
    Date.today < end_time
  end
end
