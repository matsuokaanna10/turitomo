class BulletinBoard < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
end
