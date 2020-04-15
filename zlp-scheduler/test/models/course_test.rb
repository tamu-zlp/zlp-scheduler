require 'test_helper'
require 'date'

class CourseTest < ActiveSupport::TestCase
  test "Can Parse a Course from HTML (Large fixture, testing overall entries only)" do
    html_data = File.read("test/fixtures/files/CourseListingTestLargeFixture.html")
    course_list = Course.ParseHTMLToCourses(html_data)
    assert_equal 97, course_list.length
  end
  
  test "Can Parse Course details correctly (Small fixture, testing explicit fields)" do
    html_data = File.read("test/fixtures/files/CourseListingTestSmallFixture.html")
    expected_one = Course.new do |c|
      c.full_subject = 'Accounting'
      c.abbreviated_subject = 'ACCT'
      c.course_name = 'SURVEY OF ACCT PRIN'
      c.course_number = 209
      c.section_number = 501
      c.meetingtime_start = DateTime.parse('2020-01-13 08:00:00')
      c.meetingtime_end = DateTime.parse('2020-05-05 09:15:00')
      c.meeting_days = ['T']
      c.instructors = ['Morgan E. Clarke']
      c.meeting_location = 'Wehner - College of Business 113'
    end
    expected_two = Course.new do |c|
      c.full_subject = 'Accounting'
      c.abbreviated_subject = 'ACCT'
      c.course_name = 'SURVEY OF ACCT PRIN'
      c.course_number = 209
      c.section_number = 502
      c.meetingtime_start = DateTime.parse('2020-01-13 08:00:00')
      c.meetingtime_end = DateTime.parse('2020-05-05 09:15:00')
      c.meeting_days = ['R']
      c.instructors = ['Morgan E. Clarke']
      c.meeting_location = 'Wehner - College of Business 113'
    end
    course_list = Course.ParseHTMLToCourses(html_data, 'Accounting')
    assert_equal expected_one, course_list[0]
    assert_equal expected_two, course_list[1]
  end
end
