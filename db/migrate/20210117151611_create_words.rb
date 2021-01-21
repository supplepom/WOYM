class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :story, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
