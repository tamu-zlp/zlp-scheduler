Given /the following terms exist/ do |terms_table|
    terms_table.hashes.each do |term|
        Term.create term
    end
end

Given /the following cohorts exist/ do |cohorts_table|
    cohorts_table.hashes.each do |cohort|
        Cohort.create cohort
    end
end

Given /the active term is "(.*)"/ do |term|
    active_term = Term.find_by(:name => term)
    Term.update_all active: false
    active_term.update_attributes!(:active => true)
end