# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },

    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  teams = game_hash.keys
  points = nil
  teams.each do |team|
    if game_hash[team][:players].find{|player, stats| player == name}
      points = game_hash[team][:players][name][:points]
    end
  end
  points
end

def shoe_size(name)
  teams = game_hash.keys
  shoe = nil
  teams.each do |team|
    if game_hash[team][:players].find{|player, stats| player == name}
      shoe = game_hash[team][:players][name][:shoe]
    end
  end
  shoe
end

def team_colors(name)
  teams = game_hash.keys
  team_colors = nil
  teams.each do |team|
    if game_hash[team][:team_name] == name
      team_colors = game_hash[team][:colors]
    end
  end
  team_colors
end

def team_names
  teams = game_hash.keys
  team_names = []
  teams.each do |team|
    team_names << game_hash[team][:team_name]
  end
  team_names
end

def player_numbers(name)
  teams = game_hash.keys
  jerseys = []
  teams.each do |team|
    if game_hash[team][:team_name] == name
      game_hash[team][:players].each do |player, stats|
        jerseys << game_hash[team][:players][player][:number]
      end

      break
    end
  end
  jerseys
end

def player_stats(name)
  teams = game_hash.keys
  stats = nil
  teams.each do |team|
    if game_hash[team][:players].find{|player, stats| player == name}
      stats = game_hash[team][:players][name]
      #puts
    end
  end
  stats
end

def big_shoe_rebounds
  teams = game_hash.keys
  biggest_shoe_size = -1
  rebounds = -1
  teams.each do |team|
    game_hash[team][:players].each do |name, stats|
      if biggest_shoe_size < game_hash[team][:players][name][:shoe]
        biggest_shoe_size = game_hash[team][:players][name][:shoe]
        rebounds = game_hash[team][:players][name][:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  teams = game_hash.keys
  most_points = -1
  player_name = ""
  teams.each do |team|
    game_hash[team][:players].each do |name, stats|
      if most_points < game_hash[team][:players][name][:points]
        most_points = game_hash[team][:players][name][:points]
        player_name = name
      end
    end
  end
  player_name
end

def winning_team
  teams = game_hash.keys
  home_points = 0
  away_points = 0
  teams.each do |team|
    game_hash[team][:players].each do |name, stats|
      team == :home ? home_points += game_hash[team][:players][name][:points] : away_points += game_hash[team][:players][name][:points]

    end
  end

  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end


def player_with_longest_name
  teams = game_hash.keys
  name_length = -1
  player_name = ""
  teams.each do |team|
    game_hash[team][:players].each do |name, stats|
      if name_length <= name.length
        name_length = name.length
        player_name = name
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  teams = game_hash.keys
  most_steals = -1
  player_name = ""
  teams.each do |team|
    game_hash[team][:players].each do |name, stats|
      if most_steals < game_hash[team][:players][name][:steals]
        most_steals = game_hash[team][:players][name][:steals]
        player_name = name
      end
    end
  end

  player_with_longest_name == player_name
end
