class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :creator?, only: [:edit, :update, :destroy]

  def index
  end

  def show
    @gossip = gossip_find
    @id = params[:id]
  end

  def new
  end

  def create
    @gossip = Gossip.new(
      user: current_user,
      title: params[:title],
      content: params[:content]
    )
    if @gossip.save
      redirect_to gossips_path, alert: 'Potin enregistré !'
    else
      @gossip.errors.messages.each_with_index do |m, index|
        flash.now[:alert] = m[index + 1][0]
      end
      render :new
    end
  end

  def edit
    @gossip = gossip_find
  end

  def update
    @gossip = gossip_find
    if @gossip.update(post_params)
      redirect_to gossips_path, alert: 'Modification enregistrée !'
    else
      flash.now[:alert] = "Le potin n'a pas pu être modifié"
      render :edit
    end
  end

  def destroy
    @gossip = gossip_find

    if @gossip.destroy
      redirect_to gossips_path, alert: 'Suppression réussie !'
    else
      flash.now[:alert] = 'Echec à la suppression !'
      render :show
    end
  end

  private

  def gossip_find
    gossip = Gossip.find(params[:id])
  end

  def creator?
    unless gossip_find.user == current_user
      redirect_to gossip_path(gossip_find.id), alert: "Ce n'est pas votre potin !"
    end
  end

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end
end
