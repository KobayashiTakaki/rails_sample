class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :product_id, null: false, index: true
      t.integer :unit_price, null: false
      t.integer :shop_id, null: false, index: true
      t.integer :amount, null: false

      t.timestamps
    end

    add_foreign_key :purchases, :shops, column: :shop_id
    add_foreign_key :purchases, :products, column: :product_id
  end
end
