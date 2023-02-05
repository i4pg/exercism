require_relative 'tournament'

class Match
  def initialize(match)
    @home, @away, @result = match.split(';')
    set_teams(@home, @away)
    match_counter
    set_points
  end

  def set_teams(home, away)
    if @result.match?(/win/)
      @opponent = away.is_a?(Team) ? @opponent : Team.new(away)
      @team = home.is_a?(Team) ? @team : Team.new(home)
    else
      @team = home.is_a?(Team) ? @team : Team.new(home)
      @opponent = away.is_a?(Team) ? @opponent : Team.new(away)
    end
    [@team, @opponent]
  end

  def match_counter
    [@team, @opponent].each { |team| team.matches_played += 1 }
  end

  def set_points
    case @result
    when /win/
      @team.won += 1
      @opponent.lost += 1
      @team.points += Tournament::WIN_POINTS
      @opponent.points += Tournament::LOSS_POINTS unless @opponent.points.zero?
    when /draw/
      @team.draw += 1
      @opponent.draw += 1
      @team.points += Tournament::TIE_POINTS
      @opponent.points += Tournament::TIE_POINTS
    when /loss/
      @team.lost += 1
      @opponent.won += 1
      @opponent.points += Tournament::WIN_POINTS
      @team.points += Tournament::LOSS_POINTS unless @team.points.zero?
    end
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
