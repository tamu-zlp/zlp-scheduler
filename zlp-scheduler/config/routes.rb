Rails.application.routes.draw do
  get 'login/index'

  root 'login#index'
  
  get 'student/view_terms', to: 'student#view_terms', as: 'view_terms'
  
  get 'student/add_schedule', to: 'student#add_schedule', as: 'add_schedule'
  
  get 'admin/view_term_admin', to: 'admin#view_term_admin', as: 'view_term_admin'
  
  get 'admin/open_semester', to: 'admin#open_semester', as: 'open_semester'
  
  get 'admin/new_term', to: 'admin#new_term', as: 'new_term'
  
  get 'admin/manage_cohorts', to: 'admin#manage_cohorts', as: 'manage_cohorts'
  
  get 'admin/manage_administrators', to: 'admin#manage_administrators', as: 'manage_administrators'
  
  get 'admin/add_cohort', to: 'admin#add_cohort', as: 'add_cohort'
  
  get 'admin/view_cohort_semester', to: 'admin#view_cohort_semester', as: 'view_cohort_semester'
  
end
