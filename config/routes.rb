FoodApp::Application.routes.draw do
	resources :users
	resources :products

	scope '/api' do
		scope '/v1' do
			scope '/getallcafes' do
				get '/' => 'foodapi#allcafes'
			end
			scope '/searchFood' do
				scope '/:name' do
					get '/' => 'foodapi#search'
				end
			end
			scope '/:cafeId' do
				scope '/getfoods' do
					get '/' => 'foodapi#getfoods'
				end
			end
			scope '/getCafeInfo' do
				scope '/:cafeId' do
					get '/' => 'foodapi#getCafeInfo'
				end
			end
			scope '/:cafeId' do
				scope '/getfood' do
					scope '/:productName' do
						get '/' => 'foodapi#getcafefood'
					end
				end
			end
			scope '/:cafeId' do
				scope '/getavailablefoods' do
					get '/' => 'foodapi#getavailablefoods'
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
