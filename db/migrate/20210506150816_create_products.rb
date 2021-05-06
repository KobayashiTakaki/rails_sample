class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false , limit: 200
      t.integer :unit_price, null: false

      t.timestamps
    end
  end
end
