# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create destroy]

  def create
    super
    redirect_to report_path(params[:report_id]), notice: 'コメントを投稿しました'
  end

  def destroy
    super
    redirect_to report_path(params[:report_id])
  end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
