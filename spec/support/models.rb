# frozen_string_literal: true

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

ActiveRecord::Schema.define do
  create_table :parent_objects
  create_table :some_objects do |t|
    t.belongs_to :parent_object
  end
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class ParentObject < ApplicationRecord
  has_many :some_objects
end

class SomeObject < ApplicationRecord
  belongs_to :parent_object
end

class ExtendedObject < SomeObject
  self.table_name = "some_objects"
end
