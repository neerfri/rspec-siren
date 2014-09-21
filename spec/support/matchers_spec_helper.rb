module RSpec
  module Siren
    module MatchersSpecHelper
      def match!
        matcher.matches?(siren_hash)
      end

      def siren_hash
        {
          class: siren_classes,
          links: siren_links,
          entities: siren_entities,
          properties: siren_properties,
        }
      end

      def siren_classes
        [ "my-class" ]
      end

      def siren_links
        [
          { rel: ["my-link"], href: "http://example.com" },
        ]
      end

      def siren_entities
        [
          { class: ["my-entity"], href: "http://example.com" },
          { class: ["my-entity"], href: "http://example.com" },
        ]
      end

      def siren_properties
        {
          someProperty: "someValue"
        }
      end

      class MatchSirenMatcher < Struct.new(:siren_hash)
        def matches?(matcher)
          @matcher = matcher
          matcher.matches?(siren_hash) == true
        end

        def description
          "match"
        end

        def failure_message
          "expected to match but did not match." \
            " original failure message is: " \
            "#{@matcher.failure_message.inspect}"
        end

        def failure_message_when_negated
          "expected to not match but matched"
        end
      end

      def match_siren
        MatchSirenMatcher.new(siren_hash)
      end
    end
  end
end
