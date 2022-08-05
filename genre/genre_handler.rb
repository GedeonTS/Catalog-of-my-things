require_relative './genre'

module GenreModule
  def add_genres(genres)
    genre_names = %w[Pop Gospel Reggae Country]
    genre_names.each_with_index do |option, index|
      genres << Genre.new(index, option)
    end
  end

  def list_genres(genres)
    puts 'Genres:'
    genres.each do |genre|
      puts "#{genre.id} - #{genre.name}"
    end
  end
end
