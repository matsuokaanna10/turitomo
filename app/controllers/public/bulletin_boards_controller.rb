class Public::BulletinBoardsController < ApplicationController
  def new
    @bulletin_board = BulletinBoard.new
  end

  def index
    @bulletin_boards = BulletinBoard.all
    @comments = Comment.all
  end

  def show
    @bulletin_board = BulletinBoard.find(params[:id])
    @like = Like.new
    @comment = Comment.new
    @comments = @bulletin_board.comments
  end

  def create
    bulletin_board = BulletinBoard.new(bulletin_board_params)
    bulletin_board.save!
    redirect_to user_path(current_user.id)
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
    redirect_to user_path(current_user.id)
  end

  private
    def bulletin_board_params
      params.require(:bulletin_board).permit(:title, :content, tag_ids: []).merge(user_id: current_user.id)
    end
end
