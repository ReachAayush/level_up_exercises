require 'attr_init'

class Dino
  PROPERTIES = [:name,
                :period,
                :continent,
                :walking,
                :diet,
                :weight,
                :description,
                :carnivore]

  accessor_struct(*PROPERTIES)
  
  def to_s
    str = ""
    instance_variables.each { |var| str += print_var(var) }
    str + "\n"
  end

  def print_var(var)
    the_value = "#{var}: #{instance_variable_get(var)}\n"
    case1 = instance_variable_get(var) != ""
    case2 = instance_variable_get(var) != 0
    case1 && case2 ? the_value : ""
  end

end
