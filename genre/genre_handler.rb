require 'json'

module GenresHandler
  def store_genres(genre)
    file = './genre/genres.json'
    File.new('./genre/genres.json', 'w+') unless File.exist?(file)
    data = []
    data << {
      name: genre.name,
      id: genre.id
    }

    File.write(file, JSON.generate(data))
  end

  def load_genres
    data = []
    file = './genre/genres.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |genre|
      data << Genre.new(genre['name'], genre['id'])
    end
    data
  end

  def list_genres
    puts '-' * 50
    if @genres.empty?
      puts 'No genre yet!'
    else
      puts '📑 Genres list:'
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}-[Genre] ID: #{genre.id} | Name: #{genre.name}"
      end
    end
  end
end
