Rails.application.routes.draw do
  get 'login/index'

  root 'login#index'
  
  get 'student/view_terms', to: 'student#view_terms', as: 'view_terms'
  
  get 'student/add_schedule', to: 'student#add_schedule', as: 'add_schedule'
  
  get 'admin/view_cohorts', to: 'admin#view_cohorts', as: 'view_cohorts'
  
  get 'admin/add_cohort', to: 'admin#add_cohort', as: 'add_cohort'
  
  get 'admin/edit_cohort', to: 'admin#edit_cohort', as: 'edit_cohort'
  
  get 'admin/view_cohort_semester', to: 'admin#view_cohort_semester', as: 'view_cohort_semester'
end
