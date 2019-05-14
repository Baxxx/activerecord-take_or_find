# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "active_record/take_or_find/version"

Gem::Specification.new do |s|
  s.name        = "activerecord-take_or_find"
  s.version     = ActiveRecord::TakeOrFind::VERSION
  s.date        = "2019-05-14"
  s.summary     = "Add take_or_find method to ActiveRecord models"
  s.author      = "Branislav Petrovic"
  s.email       = "thruggharrog@gmail.com"
  s.homepage    = "https://github.com/Baxxx/activerecord-take_or_find"
  s.license     = "MIT"
  s.description = <<~DESC
    Gem activerecord-take_or_find provides a method on your ActiveRecord models.
    Depending on the passed argument, which can either be a number (ID) or instance of that model,
    it lets you either find a record by the ID or use the record itself.
  DESC

  s.files = [
    "lib/activerecord-take_or_find.rb",
    "lib/active_record/take_or_find/take_or_find.rb"
  ]

  s.add_runtime_dependency "activerecord", ">= 4.0.0"

  s.add_development_dependency "database_cleaner", "~> 1.7"
  s.add_development_dependency "rake", "~> 12"
  s.add_development_dependency "rspec", "~> 3.8"
  s.add_development_dependency "sqlite3", "~> 1.3.13"
end
