# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170413134333) do

  create_table "chipsets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "display_resolutions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "display_sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "front_cameras", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "product_price", precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price",   precision: 12, scale: 3
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                                           default: "",                    null: false
    t.string   "description",                                    default: "",                    null: false
    t.decimal  "price",                 precision: 12, scale: 3
    t.datetime "release_date",                                   default: '2017-04-01 00:00:00', null: false
    t.integer  "manufacturer_id"
    t.integer  "chipset_id"
    t.integer  "display_resolution_id"
    t.integer  "display_size_id"
    t.integer  "ram_id"
    t.integer  "storage_id"
    t.integer  "rear_camera_id"
    t.integer  "front_camera_id"
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
    t.index ["chipset_id"], name: "index_products_on_chipset_id"
    t.index ["display_resolution_id"], name: "index_products_on_display_resolution_id"
    t.index ["display_size_id"], name: "index_products_on_display_size_id"
    t.index ["front_camera_id"], name: "index_products_on_front_camera_id"
    t.index ["manufacturer_id"], name: "index_products_on_manufacturer_id"
    t.index ["ram_id"], name: "index_products_on_ram_id"
    t.index ["rear_camera_id"], name: "index_products_on_rear_camera_id"
    t.index ["storage_id"], name: "index_products_on_storage_id"
  end

  create_table "rams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rear_cameras", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.boolean  "is_admin",               default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
