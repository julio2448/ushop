class Coupon < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookmarks, dependent: :destroy
  validates :title, :start_time, :end_time, :product_name, :product_description, :code, presence: true
  validates_comparison_of :end_time, greater_than_or_equal_to: :start_time
  validates_comparison_of :start_time, greater_than_or_equal_to: Date.today
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_coupon,
      against: %i[title end_time product_name product_description],
      associated_against: {
        owner: %i[email]
      },
      using: {
        tsearch: { prefix: true }
      }

  def available?
    Date.today < end_time
  end

  def time_left_days
    (end_time - Date.today).to_i
  end

  def time_left_hours
    ((end_time - Date.today) * 24).to_i
  end

  def time_left_seconds
    ((end_time - Date.today) * 24 * 60 * 60).to_i
  end

  def time_left_minutes
    ((end_time - Date.today) * 24 * 60).to_i
  end
end
