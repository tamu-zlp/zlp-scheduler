FactoryBot.define do
    factory :cohort do
    end

    factory :user do
        firstname {Faker::Name.name}
        lastname {Faker::Name.name}
        email {Faker::Internet.email}
        password {Faker::Internet.password}
    end

    factory :term do
        opendate {Date.current}
        closedate {Date.current.tomorrow}
        active {true}
    end

    factory :course do
      course_number {rand(500)}
      section_number {rand(500)}
    end
    
    factory :schedule do    
    end
    
    factory :subject do     
    end    
end

