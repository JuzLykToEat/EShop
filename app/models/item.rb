class Item < ApplicationRecord
  has_many :orders, through: :ordered_items
  has_many :ordered_items

end
