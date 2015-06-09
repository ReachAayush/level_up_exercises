require_relative 'spec_helper'

RSpec.describe Cohort do
  let(:cohort) { Cohort.new("id", 100, 200) }

  describe "#new" do
    it "returns a new Cohort" do
      expect(cohort).to be_an_instance_of(Cohort)
    end
  end

  describe "#size" do
    it "adds conversions and failures to give total number of trials" do
      expect(cohort.size).to eq(300)
    end
  end
end
