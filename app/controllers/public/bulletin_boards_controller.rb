class BulletinBoardsController < ApplicationController
  def new
    @bulletin_board = BulletinBoard.new
  end
  
  def index
    @bulletin_boards = BulletinBoard.all.page(params[:page]).per(10)
  end
  
  def show
    @bulletin_board = BulletinBoard.find(params[:id])
    @user = @bulletin_board.user.all
  end
  
  def create
    bulletin_board = BulletinBoard.new(bulletin_board_params)
    bulletin_board.save
    redirect_to bulletin_board_path(bulletin_board.id)
  end
  
  def edit
    @bulletin_board = BulletinBoard.find(params[:id])
  end
  
  def update
    @bulletin_board = BulletinBoard.find(params[:id])
    @bulletin_board.update(bulletin_board_params)
    redirect_to bulletin_boardpath(@bulletin_board.id)
  end
  
  def destroy
    bulletin_board = BulletinBoard.find(params[:id])
    bulletin_board.destroy
    redirect_to bulletin_board_path(bulletin_board.id)
  end
  
  private
    def bulletin_board_params
      params.require(:bulletin_board).permit(:title, :content, :user_id)
    end
end
