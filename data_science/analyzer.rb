require_relative 'json_parser.rb'
require 'pry'
require 'ABAnalyzer'

class ConversionRateCalculator
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def cohort(id)
    all_data = @data.clone
    all_data.delete_if { |d| d["cohort"] == id }
  end

  def num_conversions(id)
    cohort(id).delete_if { |d| d["result"] == 0 }.length
  end

  def conversion_rate_interval(id)
    ABAnalyzer.confidence_interval(num_conversions(id), cohort(id).length, 0.95)
  end

  def chi_squared
    values = {}
    values[:a] = { :pass => num_conversions("A"), :fail => cohort("A").size }
    values[:b] = { :pass => num_conversions("B"), :fail => cohort("B").size }
    tester = ABAnalyzer::ABTest.new values
    if tester.chisquare_p < .05
      puts "Group A is a clear winner over group B with a confidence level of 95%"
    else
      puts "Group A is not a clear winner over group B"
  end
end

file_name = "data_export_2014_06_20_15_59_02.json"
importer = CohortDataImporter.new(file_name)
calc = ConversionRateCalculator.new(importer.data)
binding.pry
