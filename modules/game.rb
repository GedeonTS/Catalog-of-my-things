require_relative '../classes/game'
require 'json'
require 'date'

module GameData
  def load_games
    file = './json_files/games.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Game.new(element['multiplayer'], element['last_played_at']))
      end
    end
    data
  end

  def save_games
    data = []
    @games.each do |game|
      data.push({ multiplayer: game.multiplayer, last_played_at: game.last_played_at })
    end
    File.write('./json_files/games.json', JSON.generate(data))
  end

  def add_game
    puts 'Enter multiplayer'
    multiplayer = gets.chomp
    puts 'Enter last_played_at(yyyy-mm-dd)'
    last_played_at = gets.chomp
    @games.push(Game.new(multiplayer, last_played_at))
    save_games
  end

  def list_games
    @games.each do |game|
      p "multiplayer:#{game.multiplayer} last_played_at:#{game.last_played_at}"
    end
  end
end
