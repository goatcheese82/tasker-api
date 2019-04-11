Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#authenticate'
  get '/#a', to: 'application#not_found'
end
