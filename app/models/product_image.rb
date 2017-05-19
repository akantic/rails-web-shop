class ProductImage < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :image, ImageUploader

  def custom_label_method
    "##{self.img_order} - #{File.basename self.image.to_s}"
  end
end
