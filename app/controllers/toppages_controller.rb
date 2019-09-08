class ToppagesController < ApplicationController
    def index
        @documents = Document.order(id: :desc).page(params[:page])
        @documents = Document.page(params[:page]).per(18).order('updated_at DESC')
    end 
end 