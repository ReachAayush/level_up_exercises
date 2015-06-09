require_relative 'json_parser.rb'
require 'pry'
require 'ABAnalyzer'

class ConversionRateCalculator
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def cohort(id)
    data[id]
  end

  def cohort_size(id)
    data[id].size
  end

  def num_conversions(id)
    data[id].conversions
  end

  def num_fails(id)
    data[id].fails
  end

  def conversion_rate_interval(id)
    ABAnalyzer.confidence_interval(num_conversions(id), cohort_size(id), 0.95)
  end

  def chi_squared
    values = {}
    values[:a] = { :pass => num_conversions("A"), :fail => num_fails("A") }
    values[:b] = { :pass => num_conversions("B"), :fail => num_fails("B") }
    tester = ABAnalyzer::ABTest.new values
    s1 = "Group A is a clear winner over Group B with a confidence level of 95%"
    s2 = "Group A is not a clear winner over Group B"
    tester.chisquare_p < 0.05 ? s1 : s2
  end
end
