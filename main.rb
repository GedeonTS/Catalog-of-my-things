require_relative './Book/books_handler'
require_relative './Book/book'
require_relative './Label/label_handler'
require_relative './Label/label'
require_relative './author/author'
require_relative './author/author_handler'
require_relative './genre/genre'
require_relative './genre/genre_handler'

# rubocop:disable Metrics/CyclomaticComplexity
class Main
  include BooksHandler
  include LabelsHandler
  include AuthorsHandler
  include GenresHandler

  def initialize
    @books = load_books
    @labels = load_labels
    @genres = load_genres
  end

  def my_input(message)
    print message
    gets.chomp
  end

  def options1
    puts '1 => List all books'
    puts '2 => List all music albums'
    puts '3 => List all movies'
    puts '4 => List of games'
    puts "5 => List all genres (e.g 'Comedy', 'Thriller')"
    puts "6 => List all labels (e.g. 'Gift', 'New')"
    puts "7 => List all authors (e.g. 'Stephen King')"
    puts "8 => List all sources (e.g. 'From a friend', 'Online shop')"
    puts '9 => Add a book'
    puts '10 => Add a music album'
    puts '11 => Add a movie'
    puts '12 => Add a game'
    puts '13 => Exit'
  end

  def options(input)
    case input
    when 1
      list_books
    when 2
      'list_music_albums'
    when 3
      'list_games'
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      add_book
    when 8
      'add_music_album'
    when 9
      'add_game'
    else
      puts 'Please choose a valid number!'
    end
  end

  def run
    puts
    p '!!!Catalog of things App!!!'
    puts
    option = nil
    while option != 13
      puts 'Please choose an option by entrering a number: '
      options1
      print '[Input number]: '
      option = gets.chomp.strip

      if option.to_i.between?(1, 13)
        options(option.to_i)
      else
        puts 'Please choose a valid number!'
      end
    end
    puts 'GOOD BYE👋'
  end
end

app = Main.new
app.run
# rubocop:enable Metrics/CyclomaticComplexity
