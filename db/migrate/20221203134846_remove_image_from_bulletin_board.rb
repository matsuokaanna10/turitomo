class RemoveImageFromBulletinBoard < ActiveRecord::Migration[6.1]
  def change
    remove_column :bulletin_boards, :image, :string
  end
end
