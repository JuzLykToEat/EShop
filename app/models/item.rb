class Item < ApplicationRecord
  searchkick

  has_many :orders, through: :ordered_items
  has_many :ordered_items

  mount_uploader :image, ImageUploader

end
