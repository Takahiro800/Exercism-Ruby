class Tournament
  include Comparable

  attr_accessor :name, :mp, :w, :d, :l, :p

  def initialize(name)
    @name = name
    @mp = 0
    @w = 0
    @d = 0
    @l = 0
    @p = 0
  end

  def <=>(other)
    if other.is_a?(Tournament)
        return p <=> other.p  if p != other.p
        return 1 if name < other.name
        return -1 if name > other.name
    end
  end

  def self.tally(input)
    teams = []

    input.split("\n").each do |line|
      puts line
      words = line.split(';')

      case words[2]
      when "win"
        find_or_create_team(teams, words[0], "win")
        find_or_create_team(teams, words[1], "loss")
      when "draw"
        find_or_create_team(teams, words[0], "draw")
        find_or_create_team(teams, words[1], "draw")
      when "loss"
        find_or_create_team(teams, words[0], "loss")
        find_or_create_team(teams, words[1], "win")
      end
    end

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY

    teams.sort!.reverse!

    teams.each do |team|
      team.name += "                                "
      expected << "#{team.name[0,30]} |  #{team.mp} |  #{team.w} |  #{team.d} |  #{team.l} |  #{team.p}\n"
    end

    return expected

  end


  def self.find_or_create_team(teams, name, result)
    team = teams.find {|team| team.name == name}
    if team
      update_point(team, result)
    else
      team = Tournament.new(name)
      update_point(team, result)
      teams << team
    end
  end

  def self.update_point(team, result)
    team.mp += 1
    case result
    when "win"
      team.w += 1
      team.p += 3
    when "draw"
      team.p += 1
      team.d += 1
    when "loss"
      team.l += 1
    end
  end
end