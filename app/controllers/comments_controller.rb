class CommentsController < ApplicationController
  def show
  end

  def create
    @comment = Comment.new(
      user: User.find_by(first_name: 'Anonymous'),
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
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      redirect_to gossip_path(@comment.comment_type_id), alert: 'Commentaire modifié !'
    else
      redirect_to gossip_path(@comment.comment_type_id), alert: "Le commentaire n'a pu être modifié"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to gossip_path(@comment.comment_type_id), alert: 'Le commentaire à été supprimé !'
    end
  end
end
