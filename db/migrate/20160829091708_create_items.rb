class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.float :price
      t.integer :discount
      t.string :category
      t.string :image

      t.timestamps
    end
  end
end
