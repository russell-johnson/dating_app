class CreateBios < ActiveRecord::Migration
  def change
    create_table :bios do |t|
      t.string :description
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
