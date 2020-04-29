Rails.application.routes.draw do
  
  #get 'password_resets/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    get '/' => 'sessions#new'
    get 'signup'  => 'users#new' 
    resources :users
    
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    
    get '/viewterms' => 'students#view_terms'
    get '/managecohorts' => 'admin#manage_cohorts' 
    get '/view_term_admin' => 'admin#view_term_admin'
   
    get '/addcohort' => 'adminstudrecs#index'
    resources :adminstudrecs
    post '/import_from_excel' => "adminstudrecs#import_from_excel"
    
    resources :password_resets 
end
