class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.text :image_url
      t.integer :price
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
