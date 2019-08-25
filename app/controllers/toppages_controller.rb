class ToppagesController < ApplicationController
    def index
        @documents = Document.order(id: :desc).page(params[:page])
    end 
end 