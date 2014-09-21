module RSpec
  module Siren
    module Matchers
      class HasEntities
        def matches?(target)
          @target = target

          @entities = safe_entities.select do |e|
            !@klass || e[:class].include?(@klass)
          end

          !@entities.empty? && (!@count || @entities.count == @count)
        end

        def with_class(klass)
          @klass = klass
          self
        end

        def exactly(count)
          @count = count
          self
        end

        def description
          message = "have"
          message << " #{@count}" if @count
          message << " entities with klass '#{@klass}'"
        end

        def failure_message
          message = "expected"
          message << " #{@count}"
          message << " entities with class '#{@klass}'."
          message << " Found #{@entities.count}."
        end

        private

        def safe_entities
          Array(@target[:entities])
        end

      end
    end
  end
end
