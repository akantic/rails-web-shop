class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string    :name,               null: false, default: ""
      t.string    :description,        null: false, default: ""
      t.integer   :price,              null: false
      t.datetime  :release_date,       null: false,
                  default: DateTime.new(Date.today.strftime("%Y").to_i, Date.today.strftime("%m").to_i)


      ## == Relationships ==

      t.belongs_to   :manufacturer,       index: true
      t.belongs_to   :chipset,            index: true
      t.belongs_to   :display_resolution, index: true
      t.belongs_to   :display_size,       index: true
      t.belongs_to   :ram,                index: true
      t.belongs_to   :storage,            index: true
      t.belongs_to   :rear_camera,        index: true
      t.belongs_to   :front_camera,       index: true

      t.timestamps
    end

  end
end
