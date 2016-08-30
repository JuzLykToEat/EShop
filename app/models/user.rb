class User < ApplicationRecord

  has_many :orders
  
  has_secure_password
  enum role: [:user, :moderator, :admin]

  mount_uploader :image, ImageUploader
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
