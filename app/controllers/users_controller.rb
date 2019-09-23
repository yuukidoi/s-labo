class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit]
  
  
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @documents = @user.documents.order(id: :desc).page(params[:page])
    counts(@user)
    @favorites = @user.likes.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '登録しました'
      @user && @user.authenticate(@user.password)
    session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = '登録失敗しました'
      render :new
    end 
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end 
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
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "See You Again!"
    redirect_to root_url
  end
  
  def likes
    @user = User.find(params[:id])
    counts(@user)
    #counts(@user)
        #@likes = @user.favorites.page(params[:page])
    @likes = @user.likes.page(params[:page]).per(18).order('updated_at DESC')
  end 
  
  def mylog
    @user = User.find(params[:id])
    counts(@user)
    @mylog = @user.documents.page(params[:page]).per(18).order('updated_at DESC')
  end 
  
  

private

  def user_params
    params.require(:user).permit(:name, :email, :introduce, :password, :password_confirmation, :image, :image_cache)
  end 


  
  
end
