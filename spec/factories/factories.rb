# frozen_string_literal: true

FactoryBot.define do
  to_create do |instance|
    raise "Invalid record: #{instance.errors.full_messages.join(', ')}" unless
        instance.save
  end

  factory :portfolio do
    investor_name { 'Pablo' }
  end

  factory :stock do
    company { 'Netflix' }
    profit { 10 }
    price { 20 }
    investment { 10 }
    opening_date { '2022/01/02' }
  end
end
