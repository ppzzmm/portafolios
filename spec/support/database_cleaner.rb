# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:active_record].clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner[:active_record].clean_with(:transaction)
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
