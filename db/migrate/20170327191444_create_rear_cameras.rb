class CreateRearCameras < ActiveRecord::Migration[5.0]
  def change
    create_table :rear_cameras do |t|
      t.string :name

      t.timestamps
    end
  end
end
