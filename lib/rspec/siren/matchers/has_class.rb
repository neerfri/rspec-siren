module RSpec
  module Siren
    module Matchers
      class HasClass
        def initialize(expected)
          @expected = expected
        end

        def matches?(target)
          @target = target
          @target[:class] && safe_classes.include?(@expected)
        end

        def safe_classes
          Array(@target[:class])
        end

        def description
          "have siren class '#{@expected}'"
        end

        def failure_message
          "expected siren object to have class '#{@expected}' found classes: #{safe_classes.inspect}"
        end
      end
    end
  end
end
