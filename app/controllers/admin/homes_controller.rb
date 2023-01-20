class Admin::HomesController < ApplicationController
  def top
    @bulletin_board = BulletinBoard.all
  end
end
