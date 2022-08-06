require_relative './game'
require_relative '../author/author_handler'

module GameHandler
  include AuthorsHandler

  def add_game(_value)
    print 'Is this game for multiple players? [Y/N]: '
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'
    print 'Please enter the date this game was last played in [YYYY-MM-DD]: '
    last_played_at = gets.chomp
    print 'In which date was this game published? [YYYY-MM-DD]: '
    publish_date = gets.chomp
    print 'Has this game been archived? [Y/N]: '
    res = gets.chomp.downcase
    archived = case res
               when 'y' then true
               when 'n' then false
               end
    puts 'Choose an author from the following list using the number'
    list_authors
    author_chosen = gets.chomp.to_i
    game = Game.new(multiplayer, last_played_at, publish_date)

    # trial
    if File.empty?('./games/games.json')
      @games = []
    else
      file = File.read('./games/games.json')
      @games = JSON.parse(file)
    end
    data = { author: author_chosen, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
             publish_date: game.publish_date, archived: archived }
    @games.push(data)
    File.write('./games/games.json', JSON(@games))
    puts 'Game has been created successfully ✅'
  end

  def list_all_games(_value)
    if File.empty?('./games/games.json')
      @games = []
    else
      file = File.read('./games/games.json')
      @games = JSON.parse(file)
    end
    p 'There are no games aavailable!' if @games.length.zero?
    @games.each_with_index do |game, index|
      print "[#{index + 1}] - Multiplayer: #{game['multiplayer']}, "
      puts "Last Played: #{game['last_played_at']}, Archived: #{game['archived']}"
    end
    puts
  end
end
