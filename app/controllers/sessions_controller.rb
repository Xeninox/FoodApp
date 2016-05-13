class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "Welcome, #{user.name.upcase}"
			redirect_to products_url
		else
			flash.now[:danger] = 'Invalid email and password combination!'
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
