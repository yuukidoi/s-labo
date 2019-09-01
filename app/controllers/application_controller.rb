class ApplicationController < ActionController::Base
    include SessionsHelper
  
  before_action :set_search
    
    
  def set_search
    @search = Document.ransack(params[:q])
    @results = @search.result
  end 
    
    private
    
    def require_user_logged_in
        unless logged_in?
          redirect_to login_url
        end 
    end 
    
    def counts(user)
      @count_likes = user.likes.count
    end 
end


def current_document
        @current_document ||= Document.find_by(params[:id])
end 