class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.belongs_to :product, foreign_key: true
      t.integer :percent
      t.timestamps
    end
  end
end
