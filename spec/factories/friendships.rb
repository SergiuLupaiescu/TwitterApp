# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    association :follower
    association :followed
  end
end