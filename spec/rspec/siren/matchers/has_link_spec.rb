require "spec_helper"

RSpec.describe RSpec::Siren::Matchers::HasLink do
  include RSpec::Siren::Matchers
  include RSpec::Siren::MatchersSpecHelper

  let(:expected_rel) { "some-rel" }
  let(:matcher) { have_link_with_rel(expected_rel) }
  subject { matcher }

  context "with correct rel" do
    let(:expected_rel) { "my-link" }

    it { should match_siren }

    it "describes link presence" do
      match!

      expect(matcher.description).to eq("have a link with rel 'my-link'")
    end
  end

  context "when siren object has no class attribute" do
    it { should_not match_siren }

    it "does not raise" do
      matcher = have_a_link("some-rel")
      expect { match! }.to_not raise_error
    end

    def siren_hash
      super.merge(links: nil)
    end
  end

  context "with incorrect rel" do
    let(:expected_rel) { "some-rel" }

    it { should_not match_siren }

    it "notifies about missing link" do
      match!
      expect(matcher.failure_message).to eq("has no link with rel 'some-rel'")
    end
  end
end
