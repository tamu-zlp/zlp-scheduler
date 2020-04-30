class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :schedules
  
  #takes care of caps/spaces inconsistency in email during registration
    def email=(value)
        value = value.strip.downcase
        write_attribute :email, value
    end
    
    #role-based authorization
    def student? 
  		self.role == 'student' 
    end
    def admin? 
  		self.role == 'admin' 
    end
    
end
