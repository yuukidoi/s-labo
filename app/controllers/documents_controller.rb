class DocumentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  
  def new
    @document = current_user.documents.new
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    @document = current_user.documents.build(document_params)
    
    if @document.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      flassh[:danger] = "失敗"
      render '/documents/new'
    end 
  end

  def destroy
  end
end


private

def document_params
  params.require(:document).permit(:title, :goal, :explanation, :preparation)
end 

def correct_user
  @document = current_user.documents.find_by(id: params[:id])
  unless @document
    redirect_to root_url
  end 
end 