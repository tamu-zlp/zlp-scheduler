class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :schedules, dependent: :destroy
  has_one :cohort
  
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
    
    #password_reset email, should expire after sometime.
    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end
    
    #accepts a column name and uses secure random to genearate a random string as token and makes sure token is unique.
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
    
end
