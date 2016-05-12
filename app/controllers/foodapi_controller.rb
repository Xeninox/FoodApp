class FoodapiController < ApplicationController

	def index
		render json: Product.where('user_id = ?', params[:id])
	end
end
