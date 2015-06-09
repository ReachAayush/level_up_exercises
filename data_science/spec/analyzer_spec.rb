require_relative 'spec_helper'

def make_test_data
  h = {}
  h["A"] = Cohort.new("A", 50, 100)
  h["B"] = Cohort.new("B", 25, 75)
  h
end

TEST_DATA = make_test_data

RSpec.describe ConversionRateCalculator do
  let(:calculator) { ConversionRateCalculator.new(TEST_DATA) }

  describe "#new" do
    it "returns a new Conversion Rate Calculator" do
      expect(calculator).to be_an_instance_of(ConversionRateCalculator)
    end
  end
  describe "#cohort" do
    it "returns an instance of a Cohort class based on id" do
      expect(calculator.cohort("A")).to be_an_instance_of Cohort
    end
  end
  describe "#cohort_size" do
    it "should return total number of trials in a cohort based on cohort id" do
      expect(calculator.cohort_size("B")).to be(100)
    end
  end
  describe "#num_conversions" do
    it "should return the number of conversions based on cohort id" do
      expect(calculator.num_conversions("A")).to be(50)
    end
  end
  describe "#num_fails" do
    it "should return the number of fails based on cohort id" do
      expect(calculator.num_fails("B")).to be (75)
    end
  end
  describe "#conversion_rate_interval" do 
    it "should return a range of the conversion rate" do
      expect(calculator.conversion_rate_interval("A")).to start_with(0.25789428489358723)
    end
  end
  describe "#chi_squared" do
    it "should not return anything, just print wether there is a clear winner" do
      expect(calculator.chi_squared).to eq("Group A is not a clear winner over Group B")
    end
  end
end
