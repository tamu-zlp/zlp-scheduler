Rails.application.routes.draw do
  get 'login/index'

  root 'login#index'
  
  get 'student/view_terms', to: 'student#view_terms', as: 'view_terms'
  
  get 'student/add_schedule', to: 'student#add_schedule', as: 'add_schedule'
end
