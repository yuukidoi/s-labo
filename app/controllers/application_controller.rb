class ApplicationController < ActionController::Base
    include SessionsHelper
  
  before_action :set_search
    
    
  def set_search
    @search = Document.ransack(params[:q])
    @documents = @search.result
  end 
    
    private
    
    def require_user_logged_in
        unless logged_in?
          redirect_to login_url
        end 
    end 
end
