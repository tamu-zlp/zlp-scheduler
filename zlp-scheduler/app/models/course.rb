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
  
  DAY_ABBREV_MAP = {
    'M' => 'monday',
    'T' => 'tuesday',
    'W' => 'wednesday',
    'TR' => 'thursday',
    'F' => 'friday',
    'SA' => 'saturday',
    'SU' => 'sunday'
  }
  
  def self.ImportCourses!(term, subject)
    courses_json = CourseScraper.get_courses(term.term_code, subject.subject_code)
    courses_json.each do |course_json|
      c = Course.new
      c.full_subject = course_json['subject_description']
      c.abbreviated_subject = course_json['subject']
      c.course_name = course_json['courseTitle']
      c.course_number = course_json['courseNumber']
      c.section_number = course_json['sequenceNumber']
      #There are potentially many meeting types, Lecture, Exam, Lab, etc...
      #Everyone I've looked at thus far has been lecture first. Unsure how to
      #treat an Exam or Lab period that doesn't happen regularly.
      first_meeting_category = course_json['meetingsFaculty'][0]['meetingTime']
      start_time = first_meeting_category['beginTime']
      end_time = first_meeting_category['endTime']
      start_date = first_meeting_category['startDate']
      end_date = first_meeting_category['endDate']
      if [start_time, end_time, start_date, end_date].any?{|e| e.nil?}
        c.meetingtime_start = nil
        c.meetingtime_end = nil
      else
        c.meetingtime_start = DateTime.strptime("#{start_date} #{start_time}", "%m/%d/%Y %H%M")
        c.meetingtime_end = DateTime.strptime("#{end_date} #{end_time}", "%m/%d/%Y %H%M")
      end
      c.meeting_days = []
      DAY_ABBREV_MAP.each do |abbrev, full_day|
        if course_json['meetingsFaculty'][0][full_day]
          c.meeting_days << abbrev
        end
      end
      c.instructors = nil
      c.meeting_location = nil
      c.subject_id = subject.id
      c.term_id = term.id
      c.save
    end
  end
  
  def ==(comparison_object)
    self.attributes == comparison_object.attributes
  end
end


