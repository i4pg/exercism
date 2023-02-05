class Team
  attr_accessor :matches_played, :points, :won, :lost, :draw
  attr_reader :team, :all

  def initialize(team_name)
    @team = team_name
    @matches_played = 0
    @points = 0
    @won = 0
    @lost = 0
    @draw = 0
  end

  def to_s
    @team
  end

  def +@(points)
    @matches_played += points
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
