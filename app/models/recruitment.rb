class Recruitment < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :bulletin_board
  
  validates :title, presence: true
  validates :overview, presence: true
end
