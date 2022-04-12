# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user
    text { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
