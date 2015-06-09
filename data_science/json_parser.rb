require 'rubygems'
require 'json'
require 'pry'
require_relative 'cohort'

class CohortDataImporter

  attr_accessor :json_data, :cohort_data

  def initialize(file)
    @json_data = JSON.parse(File.read(file))
    @cohort_data = {}
    @cohort_data["A"] = create_cohort("A")
    @cohort_data["B"] = create_cohort("B")
    puts @cohort_data
  end

  def cohort(id)
    all_data = @json_data.clone
    all_data.keep_if { |d| d["cohort"] == id }
  end

  def num_conversions(id)
    cohort_data = cohort(id)
    cohort_data.keep_if { |d| d["result"] == 1 }.length
  end

  def num_fails(id)
    cohort(id).length - num_conversions(id)
  end

  def create_cohort(id)
    Cohort.new(id, num_conversions(id), num_fails(id))
  end
end
