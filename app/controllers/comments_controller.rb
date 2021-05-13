class CommentsController < ApplicationController

  before_action :authenticate_user, only: [:create]
  before_action :creator?, only: [:edit, :update, :destroy]

  def show
  end

  def create
    @comment = Comment.new(
      user: current_user,
      content: params[:content],
      comment_type_type: "Gossip",
      comment_type_id: params[:gossip_id]
    )
    if @comment.save
      redirect_to gossip_path(params[:gossip_id]), alert: 'Commentaire publié !'
    else
      redirect_to gossip_path(params[:gossip_id]), alert: 'Erreur lors de la publication !'
    end
  end

  def edit
    @id = params[:gossip_id]
    @comment = comment_find
  end

  def update
    @comment = comment_find
    if @comment.update(content: params[:content])
      redirect_to gossip_path(@comment.comment_type_id), alert: 'Commentaire modifié !'
    else
      redirect_to gossip_path(@comment.comment_type_id), alert: "Le commentaire n'a pu être modifié"
    end
  end

  def destroy
    @comment = comment_find
    if @comment.destroy
      redirect_to gossip_path(@comment.comment_type_id), alert: 'Le commentaire à été supprimé !'
    end
  end

  private

  def comment_find
    Comment.find(params[:id])
  end

  def creator?
    unless comment_find.user == current_user
      redirect_to gossip_path(comment_find.comment_type_id), alert: "Ce n'est pas votre commentaire !"
    end
  end
end
