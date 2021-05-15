class UserController < ApplicationController
  def show
    @user = current_user
  end

  def new
  end

  def create

    if exists?(params[:city])
      @city = find_city(params[:city])
    else
      @city = create_city(params[:city], params[:zip_code])
    end

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
      p '$' * 30
      p session[:user_id]
      p '$' * 30
      redirect_to gossips_path, alert: "Bienvenue sur The Gossip Project #{current_user.first_name} !"
    else
      p '$' * 30
      p params
      p @user.errors.messages
      p '$' * 30
      flash.now[:danger] = "Votre compte n'a pas pu être créé, vérifiez que vous avez rempli tous les champs"
      render :new
    end
  end
end
