class Product < ApplicationRecord
  has_many :product_images
  belongs_to :manufacturer
  belongs_to :chipset
  belongs_to :display_resolution
  belongs_to :display_size
  belongs_to :ram
  belongs_to :storage
  belongs_to :rear_camera
  belongs_to :front_camera


end
