class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
    
 
  
  def create
    @posts= current_document.posts.build(post_params)
    if @posts.save
      flash[:success]= 'savephoto'
      redirect_to root_url
    else
      render 'documents/new'
    end 
  end

  def destroy
    @post.destroy
    render 'documents/new'
  end
end


private

def post_params
  params.require(:post).permit(:image, :image_cache)
end 


