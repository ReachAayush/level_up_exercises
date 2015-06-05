class Dino
  PROPERTIES = [:name,
                :period,
                :continent,
                :walking,
                :diet,
                :weight,
                :description,
                :carnivore]

  attr_accessor(*PROPERTIES)

  def initialize(args = {})
    PROPERTIES.each do |var|
      instance_variable_set("@#{var}", args[var] || "")
    end
  end

end
