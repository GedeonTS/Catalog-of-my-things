require 'json'

module AuthorsHandler
  def add_author(author)
    File.new('./author/authors.json', 'w+') unless File.exist?('./author/authors.json')

    if File.empty?('./author/authors.json')
      authors = []
    else
      data = File.read('./author/authors.json').split
      authors = JSON.parse(data.join)
    end

    authors.push({ id: author.id, first_name: author.first_name, last_name: author.last_name })

    File.write('./author/authors.json', authors.to_json)
  end

  def list_authors
    puts '-' * 50
    File.new('./author/authors.json', 'w+') unless File.exist?('./author/authors.json')

    if File.empty?('./author/authors.json')
      puts 'No Authors yet!'
    else
      data = File.read('./author/authors.json').split
      authors = JSON.parse(data.join)
      puts 'list of Authors:'
      authors.each_with_index do |author, index|
        puts "#{index + 1}-[Author] First name: #{author['first_name']} | Last name: #{author['last_name']}"
      end
    end
  end
end
