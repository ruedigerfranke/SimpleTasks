# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { 'MyString' }
    description { 'MyText' }
    user { nil }
  end
end
