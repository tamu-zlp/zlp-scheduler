class LoadCoursesJob < ApplicationJob
  queue_as :default

  def perform(term)
    if term.courses_import_complete == false
      Subject.ImportSubjectsForTerm!(term)
      term.import_all_courses!
    end
  end
end
