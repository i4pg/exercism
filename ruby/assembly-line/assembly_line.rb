class AssemblyLine
  HOURLY_PRODUCTION = 221.0
  MIN_PRODUCTION = 60.0
  SUCCESS_RATE = { 1 => 1..4,
                   0.90 => 5..8,
                   0.80 => 9..9,
                   0.77 => 10..10 }.freeze

  def initialize(custom_speed)
    @speed = custom_speed
  end

  def production_rate_per_hour
    @speed * HOURLY_PRODUCTION * calculate_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / MIN_PRODUCTION).to_i
  end

  private

  def calculate_rate
    SUCCESS_RATE.select { |_, rate| rate.include?(@speed) }.first[0]
  end
end
