# frozen_string_literal: true

module ApplicationHelper
  def commentable_comment_path(comentable, comment)
    case comentable
    when Book
      book_comment_path(comentable, comment)
    when Report
      report_comment_path(comentable, comment)
    end
  end
end
