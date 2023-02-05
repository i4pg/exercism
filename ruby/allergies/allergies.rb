class Allergies
  attr_reader :score

  ALLERGIES = {
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
  }

  def initialize(score)
    @score = score
  end

  def allergic_to?(food)
    (score & ALLERGIES[food]).nonzero?
  end

  def list
    ALLERGIES.keys.select { |food| allergic_to?(food) }
  end
end
