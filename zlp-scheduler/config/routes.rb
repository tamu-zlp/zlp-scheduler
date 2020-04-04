Rails.application.routes.draw do
  get 'users/signout'

  get 'users/register'

  get 'users/forgotpwd'

  get 'view_terms/index'
  

  #get 'users/index'
  
  get '/' => 'users#index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/dashboard' => 'view_terms#index'
  get '/registerpage' => 'users#register'
  
  get "/signedout" => "users#signout"
  get "/forgot_password" => "users#forgot_password"
  put "/forgot_password" => "users#send_password_reset_instructions"
  get "password_reset" => "users#password_reset"
put "password_reset" => "users#new_password"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
