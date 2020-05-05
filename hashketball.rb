require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

    
#game_hash[:home][:players].each{|hash| hash[:player_name].include?("Brook Lopez") ? "found" : "not found"}

# that takes in an argument of a player's name(string) and 
# returns the number of points scored for that player

def num_points_scored(player_name)
  #loop key(:home, :away) and get value(hash)
  game_hash.each do |key, value|
    
    #loop value[:players](array) item(hash)
    value[:players].each do |hash| 
      
      #if player_name is found return that array's hash[:point]
      if hash[:player_name].include?(player_name) 
        #binding.pry
        return hash[:points]
      end
    end
  end
  return "#{player_name} is not on any team"
end

# takes in an argument of a player's name and 
# returns the shoe size for that player

def shoe_size(player_name)
  #loop key(:home, :away) and get value(hash)
  game_hash.each do |key, value|
    
    #loop value[:players](array) item(hash)
    value[:players].each do |hash| 
      
      #if player_name is found return that array's hash[:shoe]
      if hash[:player_name].include?(player_name) 
        #binding.pry
        return hash[:shoe]
      end
    end
  end
  return "Cant find #{player_name}'s shoe size"
end

# takes in an argument of the team name and 
# returns an Array of that team's colors.
def team_colors(team_name)
  #From key(:home, :away) find key that matches team_name and store the key to colors
  colors = game_hash.keys.find do |key|
    game_hash[key][:team_name] == team_name
  end
  #if there is key then return that team color otherwise mssg
  colors ? game_hash[colors][:colors] : "Can't find #{team_name} here"
end

# operates on the game Hash to return an Array of the team names.
def team_names
  teams = []
  game_hash.each do |key, value|
    teams.push(game_hash[key][:team_name])
  end
  teams
end

# takes in an argument of a team name and 
# returns an Array of the jersey numbers for that team.
def player_numbers(team_name)
  
  jersey_numbers = []
  
  team = game_hash.keys.find do |key|
    game_hash[key][:team_name] == team_name
  end
  #binding.pry
  team ? game_hash[team][:players].each{ |hash| jersey_numbers.push(hash[:number]).sort} : "Can't find #{team_name} here"
  jersey_numbers
  #binding.pry
end


#takes in an argument of a player's name and 
#returns a hash of that player's stats
def player_stats(player_name)
  stats = {}
  #loop key(:home, :away) and get value(hash)
  game_hash.each do |key, value|
    
    #loop value[:players](array) player(hash)
    value[:players].each do |player| 
      
      #if player_name is found 
      if player[:player_name].include?(player_name) 
        #binding.pry
        # stats[:number] = player[:number]
        # stats[:shoe] = player[:shoe]
        # stats[:points] = player[:points]
        # stats[:rebounds] = player[:rebounds]
        # stats[:assists] = player[:assists]
        # stats[:steals] = player[:steals]
        # stats[:blocks] = player[:blocks]
        # stats[:slam_dunks] = player[:slam_dunks]
        
        stats = player
        
        return stats
      end
    end
  end
  return "Cant find #{player_name} here"
end

# Return the number of rebounds associated with the player 
# that has the largest shoe size. Break this one down into steps:
# First, find the player with the largest shoe size
# Then, return that player's number of rebounds
# Remember to think about return values here.

def big_shoe_rebounds
  
  big_shoe = 0
  rebound_num = 0
  
  #loop key(:home, :away) and get value(hash)
  game_hash.each do |key, value|
    #loop value[:players](array) player(hash)
    value[:players].each do |player| 
      if big_shoe < player[:shoe] 
        big_shoe = player[:shoe] 
        rebound_num = player[:rebounds]
      end
    end
    
  end
  rebound_num
end
