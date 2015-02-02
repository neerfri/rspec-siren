module RSpec
  module Siren
    module Matchers
      autoload :HasAction, "rspec/siren/matchers/has_action"
      autoload :HasClass, "rspec/siren/matchers/has_class"
      autoload :HasEntities, "rspec/siren/matchers/has_entities"
      autoload :HasLink, "rspec/siren/matchers/has_link"
      autoload :HasProperty, "rspec/siren/matchers/has_property"

      def have_action(expected_action)
        HasAction.new(expected_action)
      end

      def have_class(expected_class)
        HasClass.new(expected_class)
      end

      def have_entities
        HasEntities.new
      end

      def have_link_with_rel(expected_rel)
        HasLink.new(expected_rel)
      end

      def have_property(expected_name)
        HasProperty.new(expected_name)
      end
    end
  end
end

