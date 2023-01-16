class TagRelation < ApplicationRecord
  belongs_to :bulletin_board
  belongs_to :tag
end
