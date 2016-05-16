class FoodapiController < ApplicationController

	def getfoods
		render json: Product.where('user_id = ?', params[:cafeId]).select("id, name, state, user_id, ingredients, spicy, price")
	end

	def allcafes
		render json: User.select("id, name, email").all
	end

	def getcafefood
		render json: Product.where('(user_id = ? AND name = ?)', params[:cafeId], params[:productName]).select("id, name, state, user_id, ingredients, spicy, price")
	end

	def getavailablefoods
		render json: Product.where('(user_id = ? AND state = ?)', params[:cafeId], "Available").select("id, name, state, user_id, ingredients, spicy, price")
	end

	def getCafeInfo
		render json: User.where('id = ?', params[:cafeId]).select("id, name, email")
	end

	def search
		render json: Product.where('name = ?', params[:name]).select("id, name, state, user_id, ingredients, spicy, price")
	end
end
