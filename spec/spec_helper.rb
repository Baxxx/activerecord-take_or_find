# frozen_string_literal: true

require "sqlite3"
require "active_record"
require "database_cleaner"

require "support/models"

RSpec.configure do |config|
  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
