require_relative 'dino_parser.rb'
require 'pry'

class DinoDex
  attr_accessor :dinos

  def initialize(args = {})
    @dinos = []
    @dinos.replace(args[:dinos]) if args[:dinos]
  end

  def parse_csv(csv)
    parser = DinoParser.new(csv)
    @dinos = parser.get_dinos
  end

end

dinodex = DinoDex.new()
dinodex.parse_csv("dinodex.csv")
binding.pry
dinodex.dinos
