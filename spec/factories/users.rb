FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password}
    password_confirmation  {password}
    birthday               {Faker::Date.birthday(min_age: 18, max_age: 65)}
    last_name              {Gimei.name.last.kanji}
    first_name             {Gimei.name.first.kanji}
    last_name_kana         {Gimei.name.first.katakana}
    first_name_kana        {Gimei.name.first.katakana}
  end
end
