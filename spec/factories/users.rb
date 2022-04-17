FactoryBot.define do
  factory :user do
    name { 'hogehoge' }
    email { 'hogehoge@example.com' }
    password { 'hogehogefoobar' }
    password_confirmation { 'hogehogefoobar' }
  end
end