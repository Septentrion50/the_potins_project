class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(password: params[:password])
      log_in(@user)
      redirect_to gossips_path, success: "Bon retour parmi nous #{current_user.first_name}"
    else
      flash.now[:danger] = 'Mot de passe ou email invalide'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
  end
end
