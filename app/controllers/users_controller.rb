class UsersController < ApplicationController
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
  end

  def update
  end

  def destroy
  end
end


private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end 