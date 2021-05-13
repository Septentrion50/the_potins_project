class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to gossips_path, alert: "Bon retour parmi nous #{current_user.first_name}"
    else
      flash.now[:danger] = 'Mot de passe ou email invalide'
      render :new
    end
  end

  def destroy
    p '$' * 30
    p session[:id]
    p '$' * 30
    session.delete(:id)
    redirect_to gossips_path, alert: "Bonne journée !"
  end
end
