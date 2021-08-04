class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
