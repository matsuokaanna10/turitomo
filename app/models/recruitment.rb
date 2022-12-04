class Recruitment < ApplicationRecord
  
  belongs_to :user
  belongs_to :bulletin_board
end
