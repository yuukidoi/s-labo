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
      @count_likes = user.favorites.count
      @count_mylog = user.documents.count
    end 



def current_document
        @current_document ||= Document.find_by(params[:id])
end 

end