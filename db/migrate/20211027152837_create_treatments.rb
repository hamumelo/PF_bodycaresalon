class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.integer :genre_id
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end