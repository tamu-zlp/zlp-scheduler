class StudentsController < ApplicationController
    
    before_action :require_student, only: [:view_terms]    

    def view_terms
        @users = User.all
    end
    
    
    
end
