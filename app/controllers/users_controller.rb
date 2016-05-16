class UsersController < ApplicationController
	before_action :set_user, only: [:show, :destroy, :edit]
	before_filter :authorize, except: [ :new ]
	before_action :admin, only: [ :destroy, :show, :edit, :update, :new]

	def index
		@users = User.all.paginate(page: params[:page],:per_page => 6)
	end

	def new
		
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@products = Product.order(:name).where('user_id = ?', @user.id).paginate(page: params[:page],:per_page => 6)
	end

	def create
		user = User.new(user_params)
		if user.save
			#session[:user_id] = user.id
			redirect_to users_url
		else
			redirect_to '/calyxsignup'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "User successfully updated"
			redirect_to users_url
		else
			render 'edit'
		end
	end


	def destroy
		@user.destroy
		flash[:success] = "Product deleted successfully"
		redirect_to users_url
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def admin
		redirect_to(products_url) unless current_user.email == "calyxservices@calyx.com"
	end
end
