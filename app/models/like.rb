class Like < ApplicationRecord
  belongs_to :user
  belongs_to :bulletin_board
  validates_uniqueness_of :bulletin_board_id, scope: :user_id
end
