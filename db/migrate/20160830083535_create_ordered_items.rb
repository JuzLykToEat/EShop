class CreateOrderedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_items do |t|
      t.references :item
      t.references :order
      t.integer :quantity

      t.timestamps
    end
  end
end
