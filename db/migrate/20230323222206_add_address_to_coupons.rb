class AddAddressToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :address, :string
  end
end
