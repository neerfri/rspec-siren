require "spec_helper"

RSpec.describe RSpec::Siren::Matchers::HasClass do
  include RSpec::Siren::Matchers
  include RSpec::Siren::MatchersSpecHelper

  let(:expected_class) { "my-class" }
  let(:matcher) { have_class(expected_class) }
  subject { matcher }

  context "with correct class" do
    it { should match_siren }
  end

  context "with incorrect class" do
    let(:expected_class) { "wrong-class" }

    it { should_not match_siren }
  end

  context "when siren object has no class attribute" do
    it { should_not match_siren }

    def siren_hash
      super.merge(class: nil)
    end
  end
end
