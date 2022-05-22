# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create destroy]

  def create
    super
    redirect_to book_path(params[:book_id]), notice: 'コメントを投稿しました'
  end

  def destroy
    super
    redirect_to book_path(params[:book_id])
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
