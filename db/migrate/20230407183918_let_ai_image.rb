class LetAiImage < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :ai_image, :boolean, default: false
  end
end
