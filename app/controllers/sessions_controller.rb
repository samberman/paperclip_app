class SessionsController < ApplicationController
  def new
			# session[:current_user_id] = @user.id
			# current_user = User.find_by_id(session[:current_user_id])
	end

	def create
 		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		flash[:notice] = "You have logged in successfully."
		redirect_to edit_user_path(@user)
		else
		flash[:alert] = "Sorry, you are not logged in."
		# redirect_to edit_user_path(user_params)
		render :new
		end
  
	end

	def destroy
			session[:user_id] = nil
			# @user = user.destroy
			flash[:notice] = "You are now logged out."
			redirect_to root_path
	end

	# private

 #  def user_params
 #    params.require(:user).permit(:id, :email, :password, :image)
 #  end
end
