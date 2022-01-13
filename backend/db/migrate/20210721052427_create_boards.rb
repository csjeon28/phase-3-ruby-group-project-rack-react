class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :user_id
      # t.references :wish, foreign_key: true
      
      t.timestamps
    end
  end
end
