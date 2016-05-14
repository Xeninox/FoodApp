class FoodapiController < ApplicationController

	def getfoods
		render json: Product.where('user_id = ?', params[:cafeId])
	end

	def allcafes
		render json: User.all
	end

	def getcafefood
		render json: Product.where('(user_id = ? AND name = ?)', params[:cafeId], params[:productName])
	end

	def getavailablefoods
		render json: Product.where('(user_id = ? AND state = ?)', params[:cafeId], "Available")
	end
end
