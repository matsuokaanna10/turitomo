class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to bulletin_boards_path
    else
      render 'bulletin_board/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:sentence, :bulletin_board_id, :image).merge(user_id: current_user.id)
    end
end
