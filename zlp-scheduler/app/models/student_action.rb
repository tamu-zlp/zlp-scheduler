require 'date'

class StudentAction < ApplicationRecord
  def user
    User.find(user_id)
  end
  
  def readable_date
    created_at.strftime('%I:%M%p %m/%d/%Y')
  end
end
