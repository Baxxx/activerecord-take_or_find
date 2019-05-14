# frozen_string_literal: true

module ActiveRecord
  module TakeOrFind
    def self.included(receiver)
      receiver.extend ClassMethods
    end

    module ClassMethods
      def take_or_find(arg)
        arg.is_a?(self) ? arg : find(arg)
      end
    end
  end
end
