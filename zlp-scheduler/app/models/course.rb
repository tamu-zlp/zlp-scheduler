require 'nokogiri'
require 'date'
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
  
  def self.ParseHTMLToCourses(html_data, full_subject = 'Unknown')
    noko_object = Nokogiri::HTML(html_data) { |conf| conf.noblanks }
    course_rows = noko_object.xpath("/html/body/div[@class='pagebodydiv']/table[@class='datadisplaytable'][1]/tbody/tr")
    courses = []
    new_course = nil
    course_rows.each do |row|
      puts 'start row'
      puts row
      puts 'end row'
      if row.children[0].attr('class') == 'ddtitle'
          if new_course
            puts new_course.inspect
            courses << new_course
          end
          new_course = Course.new
          new_course.full_subject = full_subject
          course_header = row.children[0].xpath("a").text
          #Course Header contains the Name, Subject, Course Number, and Section Number
          #Note: The href attr within <a> does have some of this data in the URL as query params, might be cleaner to get them from there
          new_course.course_name = course_header.split('-')[0].strip
          new_course.abbreviated_subject, new_course.course_number = course_header.split('-')[2].split(" ")
          new_course.section_number = course_header.split('-')[3]
      else
        # course_details = noko_object.xpath("/html/body/div[@class='pagebodydiv']/table[@class='datadisplaytable'][1]/tbody/tr[2]/td/table/tbody/tr[2]/td[@class='dddefault']")
        course_details = row.xpath("td/table/tbody/tr[2]/td[@class='dddefault']")
        puts 'start cdetails'
        puts course_details
        puts 'end cdetails'
        #Extract raw text from HTML nodes (Including un-used data for completeness)
        #type = course_details[0].text
        time_range = course_details[1].text
        days = course_details[2].text
        puts 'days:'
        puts days
        puts 'enddays'
        location = course_details[3].text
        date_range = course_details[4].text
        #schedule_type = course_details[5].text
        instructors = course_details[6].text
        #Set instance variables
        new_course.meeting_days = days.split('')
        new_course.meeting_location = location
        new_course.set_meeting_time(time_range, date_range)
        new_course.set_instructors(instructors)
      end
    end
    if new_course
      puts new_course.inspect
      courses << new_course
    end
    courses
  end
  
  def set_instructors(instructors_text)
    self.instructors = instructors_text.split(',').map do |i|
      i.gsub('(P)', '').strip
    end
  end
  
  def set_meeting_time(time_range, date_range)
    if time_range == 'TBA' || date_range == 'TBA'
      self.meetingtime_start = nil;
      self.meetingtime_end = nil;
    else
      time_start = time_range.split('-')[0].strip
      time_end = time_range.split('-')[1].strip
      date_start = date_range.split('-')[0].strip
      date_end = date_range.split('-')[1].strip
      self.meetingtime_start = DateTime.parse("#{date_start} #{time_start}")
      self.meetingtime_end = DateTime.parse("#{date_end} #{time_end}")
    end
  end
  
  def ==(comparison_object)
    self.attributes == comparison_object.attributes
  end
end


