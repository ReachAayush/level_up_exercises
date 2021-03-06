
require_relative 'dino.rb'
require 'csv'

class DinoParser
  attr_accessor :rows
  HEADERS = {
    "NAME" => :name,
    "PERIOD" => :period,
    "CONTINENT" => :continent,
    "DIET" => :diet,
    "WEIGHT_IN_LBS" => :weight,
    "WALKING" => :walking,
    "DESCRIPTION" => :description,
    "Genus" => :name,
    "Period" => :period,
    "Carnivore" => :carnivore,
    "Weight" => :weight,
    "Walking" => :walking
  }

  def initialize(csv)
    @header_indicies = {}
    @rows = CSV.read(csv)
    get_headers(rows.shift)
  end

  def get_headers(headers)
    headers.each_index do |i|
      @header_indicies[i] = HEADERS[headers[i]]
    end
  end

  def get_dinos
    rows.map do |row|
      # create dino using row
      Dino.new(format_dino(row))
    end
  end

  def format_dino(row)
    new_dino = {}
    row.each_index do |i|
      new_dino[@header_indicies[i]] = row[i]
    end
    new_dino[:weight] = new_dino[:weight].to_i
    fix_carnivore(new_dino)
    new_dino
  end

  def fix_carnivore(dino)
    fix_carnivore_text(dino)
    fix_carnivore_bool(dino)
  end

  def fix_carnivore_text(dino)
    if dino[:carnivore] == "Yes"
      dino[:diet] = "Carnivore"
    elsif dino[:carnivore] == "No"
      dino[:diet] = "Not Carnivore"
    end
  end

  def fix_carnivore_bool(dino)
    if dino[:diet] == "Herbivore"
      dino[:carnivore] = "No"
    elsif !dino[:diet].empty?
      dino[:carnivore] = "Yes"
    end
  end
end
