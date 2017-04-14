class Product < ApplicationRecord
  has_many :product_images
  has_many :order_products
  belongs_to :manufacturer
  belongs_to :chipset
  belongs_to :display_resolution
  belongs_to :display_size
  belongs_to :ram
  belongs_to :storage
  belongs_to :rear_camera
  belongs_to :front_camera
  self.per_page = 10

  scope :with_manufacturer, -> (manufacturer) { joins(:manufacturer).where('manufacturers.name' =>  manufacturer) }
  scope :with_chipset, -> (chipset) { joins(:chipset).where('chipsets.name' => chipset) }
  scope :with_display_resolution, -> (disp_res) { joins(:display_resolution).where('display_resolutions.name' => disp_res) }
  scope :with_display_size, -> (disp_size) { joins(:display_size).where('display_sizes.name' => disp_size) }
  scope :with_ram, -> (ram) { joins(:ram).where('rams.name' => ram) }
  scope :with_storage, -> (storage) { joins(:storage).where('storages.name' => storage) }
  scope :with_rear_camera, -> (rear_cam) { joins(:rear_camera).where('rear_cameras.name' => rear_cam) }
  scope :with_front_camera, -> (front_cam) { joins(:front_camera).where('front_cameras.name' => front_cam) }

end
