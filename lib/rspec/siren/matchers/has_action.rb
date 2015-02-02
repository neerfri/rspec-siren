module RSpec
  module Siren
    module Matchers
      class HasAction
        def initialize(expected)
          @expected = expected
        end

        def matches?(target)
          @target = target
          @target[:actions] && safe_actions.map{|a| a[:name].to_s }.include?(@expected)
        end

        def safe_actions
          Array(@target[:actions])
        end

        def description
          "have siren action '#{@expected}'"
        end

        def failure_message
          "expected siren object to have action '#{@expected}' found actions: #{safe_actions.inspect}"
        end
      end
    end
  end
end
