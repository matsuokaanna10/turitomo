class Comment < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :user
  belongs_to :bulletin_board
end
