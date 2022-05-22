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
end
