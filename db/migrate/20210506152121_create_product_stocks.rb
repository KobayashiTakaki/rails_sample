class CreateProductStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :product_stocks do |t|
      t.integer :product_id, null: false, index: true
      t.integer :shop_id, null: false, index: true
      t.integer :amount, null: false

      t.timestamps
    end

    add_foreign_key :product_stocks, :shops, column: :shop_id
    add_foreign_key :product_stocks, :products, column: :product_id
  end
end
