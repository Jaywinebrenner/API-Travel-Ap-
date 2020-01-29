Rails.application.routes.draw do
  resources :destinations do
    resources :reviews
  end
  post 'authenticate', to: 'authentication#authenticate'
end
