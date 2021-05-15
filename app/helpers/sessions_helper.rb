module SessionsHelper

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    elsif
      cookies[:user_id]
      # Trouver l'utilisateur en DB a partir de son id dans le cookie
      user = user.find_by(id: cookies[:user_id])
      if user
        # Comparaison du remember_token stocke en cookie hashe, avec le hash remember_digest en db
        remember_token = cookies[:remember_token]
        remember_digest = user.remember_digest
        user_authenticated = BCrypt::Password.new(remember_digest).is_password?(remember_token)

        if user_authenticated
          log_in(user)
          current_user = user
        end
      
      end
    end
  end

  def authenticate_user
    unless current_user
       redirect_to new_session_path, alert: 'Vous devez être connecté pour faire cela !'
    end
  end

  def remember(user)
    # Generation d'un token en base64
    remember_token = SecureRandom.urlsafe_base64

    # Stockage en base de donnees
    user.remember(remember_token)

    cookies.permanent[:user_id] = { value: user.id, same_site: :lax }
    cookies.permanent[:remember_token] = { value: remember_token, same_site: :lax }
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def forget(user)
    user.update(remember_digest: nil)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out(user)
    session.delete(:user_id)
    forget(user)
  end

  def object_creator?(content)
    return true if content.user == current_user

    false
  end

  def logged_in?
    return true unless session[:user_id].nil?

    false
  end
end
