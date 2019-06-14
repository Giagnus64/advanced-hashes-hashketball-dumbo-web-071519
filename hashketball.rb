# Write your code here!

require "pry"

def game_hash
  stats_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:[
        {
          player_name:"Alan Anderson",
          number:0,
          shoe:16,
          points:22,
          rebounds:12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1
        },
        {
          player_name:"Reggie Evans",
          number:30,
          shoe:14,
          points:12,
          rebounds:12,
          assists:12,
          steals:12,
          blocks:12,
          slam_dunks:7
        },
        {
          player_name: "Brook Lopez",
          number:11,
          shoe:17,
          points:17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15
        },
        {
          player_name: "Mason Plumlee",
          number:1,
          shoe:19,
          points:26,
          rebounds:11,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5
        },
        {
          player_name:"Jason Terry",
          number:31,
          shoe:15,
          points:19,
          rebounds:2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players:[
        {
          player_name:"Jeff Adrien",
          number:4,
          shoe:18,
          points:10,
          rebounds:1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2
        },
        {
          player_name:"Bismack Biyombo",
          number:0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:22,
          blocks:15,
          slam_dunks:10
        },
        {
          player_name:"DeSagna Diop",
          number:2,
          shoe:14,
          points:24,
          rebounds:12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5
        },
        {
          player_name:"Ben Gordon",
          number:8,
          shoe:15,
          points:33,
          rebounds:3,
          assists:2,
          steals:1,
          blocks:1,
          slam_dunks:0
        },
        {
          player_name:"Kemba Walker",
          number:33,
          shoe:15,
          points:6,
          rebounds:12,
          assists:12,
          steals:7,
          blocks:5,
          slam_dunks:12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  points = 0
  game_hash.each do |(place, team_data)|
    team_data[:players].each do |hash|
      if hash[:player_name] == player_name
        points = hash[:points]
        break
      end
    end
  end
  return points
end

def shoe_size(player_name)
  shoe_size = 0
  game_hash.each do |(place, team_data)|
    team_data[:players].each do |hash|
      if hash[:player_name] == player_name
        shoe_size = hash[:shoe]
        break
      end
    end
  end
  return shoe_size
end

def team_colors(team_name)
  team_colors = 0
  game_hash.each do |(place, team_data)|
    if team_data[:team_name] == team_name
      team_colors = team_data[:colors]
      break
    end
  end
  return team_colors
end

def team_names
  team_names_array = []
  game_hash.each do |(place, team_data)|
    team_names_array.push(team_data[:team_name])
  end
  return team_names_array
end
def player_numbers(team_name)
  jersey_number_array = []
  game_hash.each do |(place, team_data)|
    if team_data[:team_name] == team_name
      team_data[:players].each do |hash|
        jersey_number_array.push(hash[:number])
      end
    break
    end
  end
  return jersey_number_array
end

def player_stats(player_name)
  player_stats_hash = {}
  game_hash.each do |(place, team_data)|
    team_data[:players].each do |player_hash|
      if player_hash[:player_name] == player_name
          player_hash.reduce(player_stats_hash) do |memo, (key, value)|
            if key != :player_name
              memo[key] = value
            end
          memo
          end
      end
    end
  end
  return player_stats_hash
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |(place, team_data)|
    team_data[:players].each do |hash|
      if shoe_size == 0
        shoe_size = hash[:shoe]
        rebounds = hash[:rebounds]
      elsif shoe_size < hash[:shoe]
        shoe_size = hash[:shoe]
        rebounds = hash[:rebounds]
      end
    end
  end
  return rebounds
end
def most_points_scored
  points = 0
  player_name = 0
  game_hash.each do |(place, team_data)|
    team_data[:players].each do |hash|
      if points == 0
        points = hash[:points]
        player_name = hash[:player_name]
      elsif points < hash[:points]
        points = hash[:points]
        player_name = hash[:player_name]
      end
    end
  end
  return player_name
end
def winning_team
  teams_and_points = []
  home_team_name = 0
  away_team_name = 0
  home_points = 0
  away_points = 0
  game_hash.each do |(place, team_data)|
    counter = 0
    team_data[:players].each do |hash|
      counter += hash[:points]
    end
    teams_and_points.push({
      team_name => counter
    })
    if place == :home
      home_team_name = team_data[team_name]
      home_points = counter
    else
      away_team_name = team_data[team_name]
      away_points = counter
    end
  end
  if away_points > home_points
    team_won = away_team_name
  else
    team_won = home_team_name
  end
p team_won
end

winning_team











=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry

      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end
good_practices
=end
