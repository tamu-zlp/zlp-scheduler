require 'nokogiri'
require 'date'
require 'net/http'
require 'json'
require "uri"
# Example of Course in Database
  # full_subject: Accounting
  # abbreviated_subject: ACCT
  # course_name: SURVEY OF ACCT PRIN
  # course_number: 209
  # section_number: 501
  # meetingtime_start: 2020-01-13 08:00:00
  # meetingtime_end: 2020-05-05 09:15:00
  # meeting_days:
  #   - T
  # instructors:
  #   - Morgan E. Clarke
  # meeting_location: Wehner - College of Business 113
  # term: nil
class Course < ApplicationRecord
  belongs_to :term
  belongs_to :subject
  
  def ==(comparison_object)
    self.attributes == comparison_object.attributes
  end
end


