class Term < ApplicationRecord
  has_many :courses
  has_many :subjects

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
end
