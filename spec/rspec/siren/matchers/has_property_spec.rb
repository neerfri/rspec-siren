require "spec_helper"

RSpec.describe RSpec::Siren::Matchers::HasProperty do
  include RSpec::Siren::Matchers
  include RSpec::Siren::MatchersSpecHelper

  let(:expected_property) { :someProperty }
  let(:matcher) { have_property(expected_property) }
  subject { matcher }

  context "with existing property" do
    it { should match_siren }

    context "and correct value" do
      let(:matcher) { super().with_value("someValue") }

      it { should match_siren }
    end

    context "and wrong value" do
      let(:matcher) { super().with_value("wrongValue") }

      it { should_not match_siren }
    end
  end

  context "with non-existing property" do
    let(:expected_property) { :nonExistingProperty }

    it { should_not match_siren }
  end

  context "when siren has no properties attribute" do
    it { should_not match_siren }

    def siren_hash
      super.merge(properties: nil)
    end
  end
end
