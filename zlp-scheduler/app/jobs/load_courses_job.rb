class LoadCoursesJob < ApplicationJob
  queue_as :default

  def perform(term)
    Subject.ImportSubjectsForTerm!(term)
    term.import_all_courses!
  end
end
