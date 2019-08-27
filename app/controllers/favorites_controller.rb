class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  
  def create
    document = Document.find(params[:document_id])
    current_user.like(document)
    flash[:success]= '保存しました'
    redirect_to document_path(document.id)
  end

  def destroy
    document = Document.find(params[:document_id])
    current_user.dislike(document)
    flash[:success] = '解除しました'
    redirect_to  document_path(document.id)
  end
end
