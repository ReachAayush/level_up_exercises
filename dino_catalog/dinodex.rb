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
    @dinos.concat(parser.get_dinos)
  end

  def clone
    DinoDex.new(dinos: @dinos)
  end

  def bipeds(args = {})
    all_dinos = args[:dinos] ? args[:dinos] : clone.dinos
    all_dinos.delete_if { |dino| dino.walking.upcase != "BIPED" }
  end

  def carnivores(args = {})
    all_dinos = args[:dinos] ? args[:dinos] : clone.dinos
    all_dinos.delete_if { |dino| dino.diet.upcase == "HERBIVORE" }
    all_dinos.delete_if { |dino| dino.diet.upcase == "NOT CARNIVORE" }
  end

  def in_period(period, args={})
    all_dinos = args[:dinos] ? args[:dinos] : clone.dinos
    all_dinos.keep_if { |dino| dino.period.upcase.include? period.upcase}
  end

  def big(args = {})
    all_dinos = args[:dinos] ? args[:dinos] : clone.dinos
    all_dinos.delete_if { |dino| dino.weight > 4000 }
  end

  def 

end

dinodex = DinoDex.new
dinodex.parse_csv("dinodex.csv")
dinodex.parse_csv("african_dinosaur_export.csv")
binding.pry
dinodex.dinos
