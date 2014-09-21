module RSpec
  module Siren
    module Matchers
      class HasProperty
        def initialize(expected_name)
          @expected_name = expected_name
        end

        def matches?(target)
          @target = target

          @value = safe_properties[@expected_name]

          property_exists? && (!has_expected_value? || expected_value_matches?)
        end

        def with_value(expected_value)
          @expected_value = expected_value
          self
        end

        def has_expected_value?
          !!@expected_value
        end

        def expected_value_matches?
          @value == @expected_value
        end

        def property_exists?
          safe_properties.has_key?(@expected_name)
        end

        def description
          message = "have"
          message << " property '#{@expected_name}'"
          message << " with value '#{@expected_value}'"
        end

        def failure_message
          message = "expected"
          message << " property '#{@expected_name}'"
          message << " with value '#{@expected_value}'" if @expected_value
          message << ". Found"
          if !property_exists?
            message << " no such property."
          else
            message << " with value '#{@value}'"
          end
          message
        end

        private

        def safe_properties
          @target[:properties] || @target["properties"] || {}
        end
      end
    end
  end
end
