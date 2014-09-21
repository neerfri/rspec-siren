require "spec_helper"

RSpec.describe RSpec::Siren::Matchers::HasEntities do
  include RSpec::Siren::Matchers
  include RSpec::Siren::MatchersSpecHelper

  let(:expected_rel) { "some-rel" }
  let(:matcher) { have_entities }
  subject { matcher }

  context "with any entity" do
    it { should match_siren }

    context "and correct count" do
      let(:matcher) { super().exactly(2) }

      it { should match_siren }
    end

    context "and wrong count" do
      let(:matcher) { super().exactly(3) }

      it { should_not match_siren }
    end
  end

  context "with existing entity class" do
    let(:matcher) { super().with_class("my-entity") }

    it { should match_siren }

    context "and correct count" do
      let(:matcher) { super().exactly(2) }

      it { should match_siren }
    end

    context "and wrong count" do
      let(:matcher) { super().exactly(3) }

      it { should_not match_siren }
    end
  end

  context "with no entities" do
    it { should_not match_siren }

    def siren_hash
      super.merge(entities: [])
    end
  end

  context "when siren has no entities attribute" do
    it { should_not match_siren }

    def siren_hash
      super.merge(entities: nil)
    end
  end
end
