FactoryBot.define do
    factory :cohort do
        id {rand(10000)}
    end

    factory :user do
        firstname {Faker::Name.name}
        lastname {Faker::Name.name}
        email {Faker::Internet.email}
        password {Faker::Internet.password}
    end
          
    factory :term do
        id {rand(10000)}
        opendate {Date.current}
        closedate {Date.current.tomorrow}
        active {true}
    end
end
