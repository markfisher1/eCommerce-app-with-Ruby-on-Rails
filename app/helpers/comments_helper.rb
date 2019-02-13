module CommentsHelper

  def formatDate(comment)
    "#{time_ago_in_words(comment.created_at)} ago"
  end

end
