require "spec_helper"

RSpec.describe RSpec::Siren::Matchers::HasAction do
  include RSpec::Siren::Matchers
  include RSpec::Siren::MatchersSpecHelper

  let(:expected_action) { "update-resource"}
  let(:matcher) { have_action(expected_action) }
  subject { matcher }

  context "with correct action" do
    it { should match_siren }
  end

  context "with incorrect action" do
    let(:expected_action) { "unknown-action"}

    it { should_not match_siren }
  end

  context "when siren has no actions attribute" do
    it { should_not match_siren }

    def siren_hash
      super.merge(actions: nil)
    end
  end
end
