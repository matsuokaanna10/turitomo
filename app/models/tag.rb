class Tag < ApplicationRecord
  has_many :tag_relations, dependent: :destroy
  has_many :bulletin_boards, through: :tag_relations, dependent: :destroy
end
