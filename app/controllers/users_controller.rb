class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
   
  end

  def create
    @user = User.new(user_params)
    puts params.inspect
    if @user.save
      flash[:notice] = "Welcome to the CerebralPosi blog!"
      redirect_to user_path @user
    else
      flash[:alert] = "Sorry, something went wrong."
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "changes saved!"
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :image)
  end
end
