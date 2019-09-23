class DocumentsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :edit, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  

  
  def new
    @document = current_user.documents.new
    3.times { @document.posts.build }
    
  end

  def show
    @document = Document.find(params[:id])
    @posts = @document.posts.all
    @comment = @document.comments.new
    @comments = @document.comments.page(params[:page])
    
    #@posts = @document.posts.first
  end
  
  def download
    @upload_file = Document.find(params[:id])
    filepath = @upload_file.file.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @upload_file.file.url.gsub(/.*\//,''), :length => stat.size)
    
  end
  
  
  

  def create
    @document = current_user.documents.build(document_params)
    #@document.posts.build
    if @document.save
      #@posts.save
      @document.posts.create
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      @document = current_user.documents.build(document_params)
      flash[:danger] = "失敗"
      render :new
    end 
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    
    flash[:success] = "削除しました"
    redirect_to user_path(@document.user.id)
  end

  


private

  def document_params
    params.require(:document).permit(:title, :goal, :explanation, :preparation, :school, :grade, :subject, :content, :file, :tag_list, posts_attributes: [:id, :post_id, :_destroy, :image, :image_cache, :image_comment])
  end 
  
  def post_params
    params.require(:post).permit(:image, :image_cache,:image_comment)
  end 
  
  def correct_user
    @document = current_user.documents.find_by(id: params[:id])
    unless @document
      redirect_to root_url
    end 
  end 

end