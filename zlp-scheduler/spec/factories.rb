FactoryBot.define do
    factory :cohort do
    end
    factory :user do
        firstname {Faker::Name.first_name}
        lastname {Faker::Name.last_name}
        email {"%s@tamu.edu" % Faker::Internet.username}
        password {Faker::Internet.password}
    end

    factory :term do
        opendate {Date.current}
        closedate {Date.current.tomorrow}
        active {true}
    end
end
