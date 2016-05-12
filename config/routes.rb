FoodApp::Application.routes.draw do
	resources :users
	resources :products

	scope '/api' do
		scope '/v1' do
			scope '/:id' do
				get '/' => 'foodapi#index'
			end
		end
	end

	root 'sessions#new'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'


	get '/signup' => 'users#new'
	post 'users' => 'users#create'
end
