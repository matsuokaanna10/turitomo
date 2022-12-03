class BulletinBoard < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  belongs_to :user
end
