class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age
      t.string :gender, null: false
      t.string :email
      t.string :phone
      t.string :race

      t.timestamps null: false
    end
  end
end
