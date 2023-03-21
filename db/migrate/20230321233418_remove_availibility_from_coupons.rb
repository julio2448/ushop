class RemoveAvailibilityFromCoupons < ActiveRecord::Migration[7.0]
  def change
    remove_column :coupons, :availibility, :boolean
  end
end
