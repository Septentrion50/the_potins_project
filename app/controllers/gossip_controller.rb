class GossipController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @gossip = Gossip.new(
      user: User.find_by(first_name: 'Anonymous'),
      title: params[:title],
      content: params[:content]
    )
    
    if @gossip.save
      flash.alert = 'Potin enregistré !'
      redirect_to gossip_index_path
    else
      flash.alert = "Erreur d'enregistrement"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

end
