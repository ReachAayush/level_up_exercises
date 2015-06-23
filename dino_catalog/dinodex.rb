require_relative 'dino_parser.rb'
require 'pry'

class DinoDex
  attr_accessor :dinos

  def initialize(args = {})
    @dinos = args[:dinos] || []
  end

  def parse_csv(csv)
    parser = DinoParser.new(csv)
    @dinos.concat(parser.get_dinos)
  end

  def clone
    DinoDex.new(dinos: @dinos)
  end

  def to_s
    output = "Dinos: \n"
    dinos.each { |dino| output += dino.to_s }
    output + "\n"
  end

  def length
    @dinos.length
  end

  def bipeds(args = {})
    all_dinos = args[:dinos] ? args[:dinos] : @dinos
    all_dinos.delete_if { |dino| dino.walking.upcase != "BIPED" }
    DinoDex.new(dinos: all_dinos)
  end

  def carnivores(args = {})
    all_dinos = args[:dinos] ? args[:dinos] : @dinos
    all_dinos.delete_if { |dino| dino.diet.upcase == "HERBIVORE" }
    all_dinos.delete_if { |dino| dino.diet.upcase == "NOT CARNIVORE" }
    DinoDex.new(dinos: all_dinos)
  end

  def in_period(period, args={})
    all_dinos = args[:dinos] ? args[:dinos] : @dinos
    all_dinos.keep_if { |dino| dino.period.upcase.include? period.upcase}
    DinoDex.new(dinos: all_dinos)
  end

  def big(args = {})
    all_dinos = args[:dinos] ? args[:dinos] : @dinos
    all_dinos.keep_if { |dino| dino.weight > 4000 }
    DinoDex.new(dinos: all_dinos)
  end
end

dinodex = DinoDex.new
dinodex.parse_csv("dinodex.csv")
dinodex.parse_csv("african_dinosaur_export.csv")
puts dinodex.in_period("late")
#binding.pry
dinodex.dinos
