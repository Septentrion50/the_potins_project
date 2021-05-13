module SessionsHelper
  def current_user
    User.find_by(id: session[:id])
  end

  def authenticate_user
    unless current_user
       redirect_to new_session_path, alert: 'Vous devez être connecté pour faire cela !'
    end
  end


  def log_in(user)
    session[:id] = user.id
  end

  def object_creator?(content)
    return true if content.user == current_user

    false
  end

  def logged_in?
    return true unless session[:id].nil?

    false
  end
end
