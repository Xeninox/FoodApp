FoodApp::Application.routes.draw do
	resources :users
	resources :products

	scope '/api' do
		scope '/v1' do
			scope '/getallshops' do
				get '/' => 'foodapi#allShops'
			end
			scope '/searchProduct' do
				scope '/:name' do
					get '/' => 'foodapi#search'
				end
			end
			scope '/:shopId' do
				scope '/getProducts' do
					get '/' => 'foodapi#getproducts'
				end
			end
			scope '/getShopInfo' do
				scope '/:shopId' do
					get '/' => 'foodapi#getShopInfo'
				end
			end
			scope '/:shopId' do
				scope '/getProduct' do
					scope '/:productName' do
						get '/' => 'foodapi#getShopProduct'
					end
				end
			end
			scope '/:shopId' do
				scope '/getAvailableProducts' do
					get '/' => 'foodapi#getAvailableProducts'
				end
			end
		end
	end


	root 'sessions#new'

	controller :sessions do
		get 'login' => :new
		post 'login' => :create
		delete 'logout' => :destroy
	end


	get '/calyxsignup' => 'users#new'
	get '/calyxallusers' => 'users#index'
	post '/users' => 'users#create'
end
