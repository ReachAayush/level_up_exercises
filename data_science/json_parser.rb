require 'rubygems'
require 'json'
require 'pry'

class CohortDataImporter

  attr_accessor :data

  def initialize(file)
    @data = JSON.parse(File.read(file))
  end

end
