# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'test4321' }
    password_confirmation { 'test4321' }
  end
end
