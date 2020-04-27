class AdminController < ApplicationController
    
     before_action :require_admin, only: [:manage_cohorts, :add_cohort]    
    
    def manage_cohorts
        @users = User.all
    end
    
    def add_cohort
     @users = User.all
    end
    
end
