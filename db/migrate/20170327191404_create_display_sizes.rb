class CreateDisplaySizes < ActiveRecord::Migration[5.0]
  def change
    create_table :display_sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
