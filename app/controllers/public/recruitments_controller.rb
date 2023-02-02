class Public::RecruitmentsController < ApplicationController
  def new
    @recruitment = Recruitment.new
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @user = @bulletin_board.user.all
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      redirect_to recruitment_path(recruitment.id)
    else
      render :new
    end
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    @recruitment.update(recruitment_params)
    redirect_to recruitment_path(@recruitment.id)
  end

  private
    def recruitment_params
      params.require(:recruitment).permit(:sentence, :image, :user_id, :bulletin_board_id)
    end
end
