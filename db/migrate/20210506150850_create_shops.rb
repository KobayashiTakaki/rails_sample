class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false, limit: 100

      t.timestamps
    end
  end
end
