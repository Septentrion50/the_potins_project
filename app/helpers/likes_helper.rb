module LikesHelper
  def liked?(content)
    c_likes = []
    content.likes.each do |l|
      c_likes << l.user
    end
    return true if c_likes.any? { |u| u == User.find_by(id: session[:user_id]) }

    false
  end
end
