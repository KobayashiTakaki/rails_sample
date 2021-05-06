class CreateProductReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :product_reviews do |t|
      t.integer :product_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.text :content, null: false

      t.timestamps
    end

    add_foreign_key :product_reviews, :products, column: :product_id
    add_foreign_key :product_reviews, :users, column: :user_id
  end
end
