require_relative 'spec_helper'

RSpec.describe CohortDataImporter do
  let(:importer) { CohortDataImporter.new("spec/test_json_data.json") }

  describe "#new" do
    it "returns a new CohortDataImporter" do
      expect(importer).to be_an_instance_of(CohortDataImporter)
    end
  end
  describe "#cohort" do
    it "returns an array of all trials in a specific cohort" do
      expect(importer.cohort("A")).to be_an_instance_of(Array)
      expect(importer.cohort("A").length).to eq(20)
    end
  end
  describe "#num_conversion" do
    it "returns the number of conversions for a specific cohort" do
      expect(importer.num_conversions("A")).to eq(5)
      expect(importer.num_conversions("B")).to eq(5)
    end
  end
  describe "#num_fails" do
    it "returns the number of fails for a specific cohort" do
      expect(importer.num_fails("A")).to eq(15)
    end
  end
  describe "#create_cohort" do
    it "returns a new Cohort given an id" do
      expect(importer.create_cohort("A")).to be_an_instance_of(Cohort)
    end
  end
end
