class NameCollisionError < RuntimeError; end

class Robot
  attr_accessor :name

  @@registry

  def create_rand_name
    generate_char = -> { ('A'..'Z').to_a.sample }
    generate_num = -> { rand(10) }
    
    new_name = "#{generate_char.call}#{generate_char.call}"
    new_name += "#{generate_num.call}#{generate_num.call}#{generate_num.call}"
    @name = new_name
  end

  def initialize(args = {})
    @@registry ||= []
    @name_generator = args[:name_generator]

    if @name_generator
      @name = @name_generator.call
    else
      create_rand_name()
    end

    if !(name =~ /[[:alpha:]]{2}[[:digit:]]{3}/) || @@registry.include?(name)
      raise NameCollisionError
    end
    @@registry << @name
  end
end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
#generator = -> { 'AA111' }
#Robot.new(name_generator: generator)
#Robot.new(name_generator: generator)
