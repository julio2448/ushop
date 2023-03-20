class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.boolean :availibility
      t.string :title
      t.date :start_time
      t.date :end_time
      t.string :product_name
      t.string :product_description
      t.string :code
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
