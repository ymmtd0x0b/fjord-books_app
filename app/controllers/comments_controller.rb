# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.save
  end

  def destroy
    comment = @commentable.comments.find(params[:id])
    comment.destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :user_id)
  end

  # リソースの所有者がログインユーザーと同じか確認
  def confirmation_of_authority
    redirect_to(root_path, alert: t('errors.messages.not_authorized')) unless @commentable.comments.find(params[:id]).user == current_user
  end
end
