# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Internet.user_name }
    f.password { 'changeme' }
    f.password_confirmation { 'changeme' }
  end
end
