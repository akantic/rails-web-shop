# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create(email: "admin@fer.hr", password:"123456", first_name:"Marko", last_name:"Admin", is_admin: true)
  User.create(email: "user@fer.hr", password:"123456", first_name:"Marko", last_name:"User", is_admin: false)

  OrderStatus.delete_all
  OrderStatus.create! id: 1, name: "In Progress"
  OrderStatus.create! id: 2, name: "Placed"
  OrderStatus.create! id: 3, name: "Shipped"
  OrderStatus.create! id: 4, name: "Complete"
  OrderStatus.create! id: 5, name: "Cancelled"

  names = ["S1", "S2", "S3", "S4", "S5", "S6", "S7", "Mi1", "Mi2", "Mi3", "M2", "Plus", "1", "2", "3", "4"]

  manufacturers = ["Samsung", "OnePlus", "Apple", "Huawei", "Xiaomi", "Meizu", "HTC", "Xperia"]
  chipsets = ["Snapdragon 400", "Snapdragon 800", "Snapdragon 600", "Mediatek X10", "Mediatek X10", "Intel Atom X8300"]
  displayResolutions = ["1280x720", "1920x1080", "2160x1440", "960x640"]
  displaySizes = ["4.5''", "4.7''", "5.0''", "5.5''"]
  rams = ["1 GB", "2 GB", "3GB", "4 GB", "512 MB"]
  storages = ["8 GB", "16 GB", "32 GB", "64 GB", "128 GB"]
  rearCameras = ["8 Mpx", "12 Mpx", "13 Mpx", "16 Mpx"]
  frontCameras = ["2 Mpx", "4 Mpx", "5 Mpx", "8 Mpx"]
  prices = [1000, 1200, 3000, 2110, 3400, 800, 9000, 2340, 2930]
  images = ["1.jpg", "2.jpg", "3.png", "4.png", "5.jpg", "6.jpg", "7.jpg"]

  manufacturers.each { |x| Manufacturer.create(name: x) }
  chipsets.each { |x| Chipset.create(name: x) }
  displayResolutions.each { |x| DisplayResolution.create(name: x) }
  displaySizes.each { |x| DisplaySize.create(name: x) }
  rams.each { |x| Ram.create(name: x) }
  storages.each { |x| Storage.create(name: x) }
  rearCameras.each { |x| RearCamera.create(name: x) }
  frontCameras.each { |x| FrontCamera.create(name: x) }

  99.times do |n|
    a = Product.create!(
                 name:  names.sample,
                 price: prices.sample,
                 manufacturer: Manufacturer.find_by(name: manufacturers.sample),
                 chipset: Chipset.find_by(name: chipsets.sample),
                 display_resolution: DisplayResolution.find_by(name: displayResolutions.sample),
                 display_size: DisplaySize.find_by(name: displaySizes.sample),
                 ram: Ram.find_by(name: rams.sample),
                 storage: Storage.find_by(name: storages.sample),
                 rear_camera: RearCamera.find_by(name: rearCameras.sample),
                 front_camera: FrontCamera.find_by(name: frontCameras.sample)
        )

    ProductImage.create!(product: a, image: File.open(File.join(Rails.root, "db/seed_images", images.sample)))

  end