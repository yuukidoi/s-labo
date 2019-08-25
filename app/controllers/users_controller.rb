class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '登録しました'
      redirect_to root_path
    else
      flash.now[:danger] = '登録失敗しました'
      render :new
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = '更新しました'
      redirect_to @user
    else
      flash.now[:danger] = "更新できませんでした"
      render :edit
    end 
  end

  def destroy
  end
end


private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
end 