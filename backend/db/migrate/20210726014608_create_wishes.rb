class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :description
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
