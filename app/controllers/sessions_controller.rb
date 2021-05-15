class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      log_in(@user)
      if params[:remember_user]
        remember(current_user)
      end
      redirect_to gossips_path, alert: "Bon retour parmi nous #{current_user.first_name}"
    else
      flash.now[:danger] = 'Mot de passe ou email invalide'
      render :new
    end
  end

  def destroy
    log_out(current_user)
    redirect_to gossips_path, alert: "Bonne journée !"
  end
end
