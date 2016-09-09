class Item < ApplicationRecord
  searchkick

  has_many :orders, through: :ordered_items
  has_many :ordered_items
  after_save :reindex_item

  mount_uploader :image, ImageUploader

  def reindex_item
    reindex
  end
end
