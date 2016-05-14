FoodApp::Application.routes.draw do
	resources :users
	resources :products

	scope '/api' do
		scope '/v1' do
			scope '/getallcafes' do
				get '/' => 'foodapi#allcafes'
			end
			scope '/:cafeId' do
			scope '/getfoods' do
					get '/' => 'foodapi#getfoods'
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
	post '/users' => 'users#create'
end
