class AddCoordinatesToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :latitude, :float
    add_column :coupons, :longitude, :float
  end
end
