class Public::BulletinBoardsController < ApplicationController
  def new
    @bulletin_board = BulletinBoard.new
  end

  def index
    if params[:search]
      @bulletin_boards = BulletinBoard.search(params[:search])
    elsif params[:tag_id]
      @bulletin_boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).bulletin_boards : BulletinBoard.all
    elsif params[:order] && params[:order] == 'oldbulletin_board'
        @bulletin_boards = BulletinBoard.all.order(id: "ASC")
    elsif params[:order] && params[:order] == 'newbulletin_board'
        @bulletin_boards = BulletinBoard.all.order(id: "DESC")
    else
      @bulletin_boards = BulletinBoard.all
    end
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
    bulletin_board.save
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
