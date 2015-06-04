require 'csv'
require 'pry'

DINODEX_PATH = "dinodex.csv"
EXPORT_PATH = "african_dinosaur_export.csv"

def find_all_in_dinodex
  results = []
  CSV.foreach(DINODEX_PATH) do |row|
    results << row[0]
  end
  results
end

def find_all_in_export
  results = []
  CSV.foreach(EXPORT_PATH) do |row|
    results << row[0]
  end
  results
end

def all_dinosaurs
  find_all_in_dinodex + find_all_in_export
end

def find_walking_in_dinodex(walking)
  results = []
  CSV.foreach(DINODEX_PATH) do |row|
    results << row[0] if row[5].upcase == walking.upcase
  end
  results
end

def find_walking_in_export(walking)
  results = []
  CSV.foreach(EXPORT_PATH) do |row|
    results << row[0] if row[4].upcase == walking.upcase
  end
  results
end

def find_walking(walking)
  find_walking_in_dinodex(walking) + find_walking_in_export(walking)
end

def find_carnivores_in_dinodex
  results = []
  CSV.foreach(DINODEX_PATH) do |row|
    check = row[3].upcase != "herbivore".upcase && row[3] != "DIET"
    results << row[0] if check
  end
  results
end

def find_carnivores_in_export
  results = []
  CSV.foreach(EXPORT_PATH) do |row|
    results << row[0] if row[2].upcase == "yes".upcase
  end
  results
end

def find_carnivores
  find_carnivores_in_dinodex + find_carnivores_in_export
end

def find_period_in_dinodex(period)
  results = []
  CSV.foreach(DINODEX_PATH) do |row|
    results << row[0] if row[1].upcase.include? period.upcase
  end
  results
end

def find_period_in_export(period)
  results = []
  CSV.foreach(EXPORT_PATH) do |row|
    results << row[0] if row[1].upcase.include? period.upcase
  end
  results
end

def find_period(period)
  find_period_in_dinodex(period) + find_period_in_export(period)
end

def find_big_small_in_dinodex(big)
  results = []
  CSV.foreach(DINODEX_PATH) do |row|
    case1 = big && row[4].to_i >= 4000
    case2 = !big && row[4].to_i < 4000 && row[4].to_i != 0
    results << row[0] if case1 || case2
  end
  results
end

def find_big_small_in_export(big)
  results = []
  CSV.foreach(EXPORT_PATH) do |row|
    case1 = big && row[3].to_i >= 4000
    case2 = !big && row[3].to_i < 4000 && row[3] != 0
    results << row[0] if case1 || case2
  end
  results
end

# if big is true then it finds dinos >= 4000 lbs
# if big is false then it finds dinos < 4000 lbs
def find_big(big)
  find_big_small_in_dinodex(big) + find_big_small_in_export(big)
end

def find_with_filters(walking, carnivores, period, big, small)
  all_dinos = all_dinosaurs
  result1 = walking ? find_walking(walking) : all_dinos
  result2 = carnivores ? find_carnivores : all_dinos
  result3 = period ? find_period(period) : all_dinos
  result4 = big ? find_big(true) : all_dinos
  result5 = small ? find_big(false) : all_dinos
  all_dinos & result2 & result3 & result4 & result5 & result1
end

def find_name_in_dinodex(name)
  CSV.foreach(DINODEX_PATH) do |row|
    if row[0].upcase == name.upcase
      puts "Name: " + row[0]
      puts "Period: " + row[1]
      puts "Continent: " + row[2]
      puts "Diet: " + row[3]
      puts "Weight in lbs: " + row[4] unless row[4].nil?
      puts "Walking: " + row[5]
      puts "Description: " + row[6] unless row[6].nil?
    end
  end
end

def find_name_in_export(name)
  CSV.foreach(EXPORT_PATH) do |row|
    if row[0].upcase == name.upcase
      puts "Genus: " + row[0]
      puts "Period: " + row[1]
      puts "Carnivore? " + row[2]
      puts "Weight: " + row [3] unless row[3].nil?
      puts "Walking: " + row[4]
    end
  end
end

def find_by_name(name)
  find_name_in_dinodex(name)
  find_name_in_export(name)
end

# puts "These are the dinosaurs that were bipeds"
# puts find_walking("biped")
# puts "These are the dinosaurs that were carnivores"
# puts find_carnivores
# puts "These are the dinosaurs that were in Cretaceous period"
# puts find_period("Cretaceous")
# puts "These are the big dinosaurs"
# puts find_big(true)

puts find_with_filters("biped", true, "Cretaceous", 1, false)

find_by_name("diplocaulus")
