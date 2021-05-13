class UserController < ApplicationController
  def show
    @user = current_user
  end

  def new
  end

  def create
    @city = City.find_by(name: params[:city])
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      description: params[:description],
      age: params[:age],
      city: @city
    )
    if @user.save
      log_in(@user)
      redirect_to gossips_path, success: "Bienvenue sur The Gossip Project #{current_user.first_name} !"
    else
      flash.now[:danger] = "Votre compte n'a pas pu être créé, vérifiez que vous avez rempli tous les champs"
      render :new
    end
  end
end
