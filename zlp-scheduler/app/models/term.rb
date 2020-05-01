class Term < ApplicationRecord
  has_many :courses
  has_many :subjects
  has_many :cohorts

  def self.ImportTermList!
    json_terms = CourseScraper.get_terms
    json_terms.each do |json_term|
      term = Term.new
      term.name = json_term['description']
      term.term_code = json_term['code']
      begin
        term.save
      rescue ActiveRecord::RecordNotUnique
        Rails.logger.debug "Duplicate Term Detected, Ignoring."
      end
    end
  end
  
  # TODO: This will take awhile, it's probably best to fire it off async
  # => and periodically check `Term.courses_import_complete` to determine
  # => if it is done or not. As it stands, this call will take upwards of 10 min.
  def import_all_courses!
    self.subjects.each do |subject|
      Course.ImportCourses!(self, subject)
    end
    self.courses_import_complete = true
    self.save
  end
end
