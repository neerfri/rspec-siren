module RSpec
  module Siren
    module Matchers
      class HasLink
        def initialize(expected_rel)
          @expected_rel = expected_rel
        end

        def matches?(target)
          @target = target
          link = safe_links.detect { |l| l[:rel].include?(@expected_rel) }

          !!link
        end

        def description
          "have a link with rel '#{@expected_rel}'"
        end

        def failure_message
          "has no link with rel '#{@expected_rel}'"
        end

        private

        def safe_links
          Array(@target[:links])
        end
      end
    end
  end
end
