class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false , limit: 200
      t.string :email, null: false, limit: 1000
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
