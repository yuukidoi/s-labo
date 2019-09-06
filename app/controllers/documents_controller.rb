class DocumentsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :edit, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  

  
  def new
    @document = current_user.documents.new
    post = @document.posts.build
    #post.image.build
  end

  def show
    @document = Document.find(params[:id])
    @post = @document.posts.all
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
    #@posts = @document.posts.build(post_params)
    if @document.save
      #@posts.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      flash[:danger] = "失敗"
      render '/documents/new'
    end 
  end

  def destroy
  end



private

  def document_params
    params.require(:document).permit(:title, :goal, :explanation, :preparation, :school, :grade, :subject, :content, :file, :tag_list, posts_attributes: [:image, :image_cache, :image_comment])
  end 
  
  def post_params
    params.require(:post).permit(:image)
  end 
  
  def correct_user
    @document = current_user.documents.find_by(id: params[:id])
    unless @document
      redirect_to root_url
    end 
  end 

end