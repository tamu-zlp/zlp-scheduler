class AdminController < ApplicationController
    
     before_action :require_admin, only: [:new, :manage_cohorts, :add_cohort, :view_term_admin]    
    
    def view_term_admin
        
    end
    
    def new
        
    end
    
    def manage_cohorts
       @user = User.all
    end
    
    def add_cohort
     
    end
    
   
end
