# frozen_string_literal: true

require "active_record/take_or_find/take_or_find"

ActiveRecord::Base.send(:include, ActiveRecord::TakeOrFind)
