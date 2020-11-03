
Given(/^Registered student and Create term and courses$/) do
 
  Capybara.server = :webrick
  @testing_department = ["ABC","DEF","GHI","JKL","MNO","PQR","STU"]
 
  @cohort = FactoryBot.create(:cohort, :name=>"Test Cohort", :term_id=>@term.id)
  @cohort.save()

  @user = FactoryBot.create(:user, :role=>"student", :cohort_id=>@cohort.id)
  @user.save()
  
  @testing_department.each do |test_subject|
    @subject = FactoryBot.create(:subject, :subject_code=>test_subject, :subject_description=>"Test", :term_id=>@term.id)
    i = 0
    while i < 4 do
      @course = FactoryBot.create(:course, :abbreviated_subject=>test_subject, :term_id=>@term.id, :subject_id=>@subject.id)
      @course.save()
      i = i + 1
    end
    @subject.save()
  end
  
end

Then (/^I click add schedule button$/) do
  click_link("Add Schedule")
end

Then (/^I click save schedule button$/) do
  click_button("Save Schedule")
end

Then (/^I click the added schedule$/) do
  click_link(@test_schedule_name)
end

def select_course_info(i)
  
  dropdown_list = page.driver.browser.find_element(:id, 'dept_select_'+i)
  options = dropdown_list.find_elements(tag_name: 'option')
  #options.each { |option| print(option.text)}
  department_selected = options[rand(1...options.length)].text # Start from idx 1, avoid blank
  select(department_selected, from: 'dept_select_'+i)
  
  dropdown_list = page.driver.browser.find_element(:id, 'course_num_select_'+i)
  options = dropdown_list.find_elements(tag_name: 'option')
  #options.each { |option| print(option.text)}
  course_selected = options[rand(1...options.length)].text # Start from idx 1, avoid blank
  select(course_selected, from: 'course_num_select_'+i)

  dropdown_list = page.driver.browser.find_element(:id, 'section_num_select_'+i)
  options = dropdown_list.find_elements(tag_name: 'option')
  #options.each { |option| print(option.text)}
  section_selected = options[rand(1...options.length)].text # Start from idx 1, avoid blank
  select(section_selected, from: 'section_num_select_'+i)
  
  return [department_selected,course_selected,section_selected]
end


Then (/^I fill in my courses$/) do
  
  @test_schedule_name = Faker::Name.last_name
  fill_in "Schedule Name:", :with => @test_schedule_name
  
  @record = []
  i = 1
  while i <= 3 do
    @record.append(select_course_info(i.to_s))
    i += 1
  end
  #print(@record)
end

Given('I should see added schedule') do
  #print(@test_schedule_name)
  if page.respond_to? :should
      page.should have_content(@test_schedule_name)
  else
      assert page.has_content?(@test_schedule_name)
  end
  
end

Then ("I should see added course information") do
  
  @record.each do |rec|
    rec.each do |info|
      #print(info)
      if page.respond_to? :should
        page.should have_content(info)
      else
        assert page.has_content?(info)
      end
    end
  end
end