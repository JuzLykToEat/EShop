class RemoveColumnOrderIdFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders,:ordereditem_id
  end
end
