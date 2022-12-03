class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :bulletin_board_id
      t.text :sentence
      t.string :image
      t.timestamps
    end
  end
end
