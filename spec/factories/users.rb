# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.safe_email }
    password              { Faker::String.random(length: 12) }
    password_confirmation { password }
  end
end
