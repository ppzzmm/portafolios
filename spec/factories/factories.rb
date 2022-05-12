# frozen_string_literal: true

FactoryBot.define do
  to_create do |instance|
    raise "Invalid record: #{instance.errors.full_messages.join(', ')}" unless
        instance.save
  end
end
