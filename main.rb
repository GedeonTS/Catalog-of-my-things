class Main 
  def options
    puts '1 => List all books'
    puts '2 => List all music albums'
    puts '3 => List all movies'
    puts '4 => List of games'
    puts "5 => List all genres (e.g 'Comedy', 'Thriller')"
    puts "6 => List all labels (e.g. 'Gift', 'New')"
    puts "7 => List all authors (e.g. 'Stephen King')"
    puts "8 => List all sources (e.g. 'From a friend', 'Online shop')"
    puts "9 => Add a book"
    puts "10 => Add a music album"
    puts "11 => Add a movie"
    puts "12 => Add a game"
    puts '13 => Exit'
  end

  def check(option)
    case option
    when 1
      p 'All books'
    when 2
      p 'All music albums'
    when 3
      p 'All movies'
    when 4
      p 'All games'
    when 5
      p 'All genres'
    when 6
      p 'All lebels'
    when 7
      p 'All authors'
    when 8
      p 'All sources'
    when 9
      p 'book added'
    when 10
      p 'Music album added'
    when 11
      p 'Movie added'
    when 12 
      p 'Add a game'
    when 13
      nil
    else
      puts 'Wrong value specified'
      options
    end
  end

  def run
    puts
    p '!!!Catalog of things App!!!'
    puts
    option = nil
    while option != 13
      puts 'Please choose an option by entrering a number: '
      options
      print '[Input number]: '
      option = gets.chomp.strip.to_i
      check(option)
      puts
    end
    puts 'GOOD BYE👋'
  end
end

app = Main.new
app.run
