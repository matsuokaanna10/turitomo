class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.integer :user_id
      t.integer :bulletin_board_id
      t.string :title
      t.text :overview
      t.string :image
      t.timestamps
    end
  end
end
