class FoodapiController < ApplicationController

	def getproducts
		render json: {status: 200, products: Product.where('user_id = ?', params[:shopId]).select("id, name, state, user_id, ingredients, spicy, price") }
	end

	def allShops
		render json: { status: 200, shops: User.select("id, name, email").all }
	end

	def getShopProduct
		render json: {status: 200, product: Product.where('(user_id = ? AND name = ?)', params[:shopId], params[:productName]).select("id, name, state, user_id, ingredients, spicy, price")}
	end

	def getAvailableProducts
		render json: {status: 200, available_products: Product.where('(user_id = ? AND state = ?)', params[:shopId], "Available").select("id, name, state, user_id, ingredients, spicy, price")}
	end

	def getShopInfo
		render json: {status: 200, shop: User.where('id = ?', params[:shopId]).select("id, name, email")}
	end

	def search
		render json: {status: 200, product: Product.where('name = ?', params[:name]).select("id, name, state, user_id, ingredients, spicy, price")}
	end
end
