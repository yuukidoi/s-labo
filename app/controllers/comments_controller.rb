class CommentsController < ApplicationController
    
    def create
       
        @comment = Comment.new(comment_params)
       
        if @comment.save
            flash[:success] = "投稿しました"
            redirect_back(fallback_location:current_document)
        else
            flash[:success] = "投稿できませんでした"
            redirect_back(fallback_location:current_document)
        end 
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_back(fallback_location:current_document)
    end


private
    def comment_params
        params.require(:comment).permit(:content, :document_id, :user_id)
    end 
    
    
end