FoodApp::Application.routes.draw do
	resources :users
	resources :products

	scope '/api' do
		scope '/v1' do
			scope '/getfoods' do
				scope '/:id' do
					get '/' => 'foodapi#index'
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


		get '/signup' => 'users#new'
		post '/users' => 'users#create'
	end
