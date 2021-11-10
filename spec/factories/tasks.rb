# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'MyString' }
    description { 'MyText' }
    status { 1 }
    user { nil }
    prpject { nil }
  end
end
