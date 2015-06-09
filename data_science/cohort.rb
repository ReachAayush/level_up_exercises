class Cohort
  attr_accessor :id, :conversions, :fails

  def initialize(id, conversions, fails)
    @id = id
    @conversions = conversions
    @fails = fails
  end

  def size
    conversions + fails
  end
end
