class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "新規登録しました。"
      redirect_to @user
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      redirect_to :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    flash[:success] = "退会しました"
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
