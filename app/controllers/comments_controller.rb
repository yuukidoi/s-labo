class CommentsController < ApplicationController
    
    def create
       
        @comment = Comment.new(comment_params)
       
        if @comment.save
            flash[:success] = "投稿しました"
            redirect_back(fallback_location:current_document)
        else
            flash[:success] = "投稿してない"
            redirect_to root_url
        end 
    end





private
    def comment_params
        params.require(:comment).permit(:content, :document_id)
    end 
    
    
end