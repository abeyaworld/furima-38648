FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.initials(number: 3) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    encrypted_password { password }
    family_name { person.last.kanji }
    first_name { person.first.kanji }
    family_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birthday { Faker::Date.backward }
  end
end
