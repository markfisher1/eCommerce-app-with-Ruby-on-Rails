FactoryBot.define do

  factory :user do

    # email {"testA@email.com"}
    # username {"testUsernameA"}
    first_name {"testA"}
    last_name {"user"}
    password {"123456"}
    admin {false}

  end

end
