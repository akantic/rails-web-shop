# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create(email: "admin@fer.hr", password:"123456", first_name:"Sample", last_name:"Admin", is_admin: true)
  User.create(email: "user@fer.hr", password:"123456", first_name:"Sample", last_name:"User", is_admin: false)

  names = ["S1", "S2", "S3", "S4", "S5", "S6", "S7", "Mi1", "Mi2", "Mi3", "M2", "Plus", "1", "2", "3", "4"]

  manufacturers = ["Samsung", "OnePlus", "Apple", "Agrokor", "Xiaomi", "Meizu", "Kplus", "Kminus"]
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
    manu = manufacturers.sample
    name = names.sample
    chipset = chipsets.sample
    dispRes = displayResolutions.sample
    dispSize = displaySizes.sample
    ram = rams.sample
    storage = storages.sample
    rearCam = rearCameras.sample
    frontCam = frontCameras.sample

    a = Product.create!(
                 name:  name,
                 price: prices.sample,
                 manufacturer: Manufacturer.find_by(name: manu),
                 chipset: Chipset.find_by(name: chipset),
                 display_resolution: DisplayResolution.find_by(name: dispRes),
                 display_size: DisplaySize.find_by(name: dispSize),
                 ram: Ram.find_by(name: ram),
                 storage: Storage.find_by(name: storage),
                 rear_camera: RearCamera.find_by(name: rearCam),
                 front_camera: FrontCamera.find_by(name: frontCam)
        )

    ProductImage.create!(product: a, image: File.open(File.join(Rails.root, "db/seed_images", images.sample)))

  end