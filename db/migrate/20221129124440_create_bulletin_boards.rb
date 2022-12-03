class CreateBulletinBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletin_boards do |t|
      t.integer :user_id
      t.string :image
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
