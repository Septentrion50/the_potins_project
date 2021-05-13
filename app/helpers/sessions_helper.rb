module SessionsHelper
  def current_user
    User.find_by(id: session[:id])
  end

  def log_in(user)
    session[:id] = user.id
  end

  def logged_in?
    return true unless session[:id].nil?

    false
  end
end
