# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    association :user
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
