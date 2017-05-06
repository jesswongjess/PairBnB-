user = {}
user['password'] = 'asdf'
user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do
    user['first_name'] = Faker::Name.first_name
    user['last_name'] = Faker::Name.last_name
    user['gender'] = rand(1..2)
    user['nationality'] = Faker::Address.country
    user['email'] = Faker::Internet.email

    user['phone'] = Faker::PhoneNumber.phone_number
    user['country'] = Faker::Address.country
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end
