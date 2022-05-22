# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.save
    redirect_to report_path(params[:report_id]), notice: 'コメントを投稿しました'
  end

  def destroy
    comment = @commentable.comments.find(params[:id])
    comment.destroy
    redirect_to report_path(params[:report_id])
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :user_id)
  end
end
