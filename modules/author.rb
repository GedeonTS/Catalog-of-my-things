require_relative '../classes/author'
require 'json'
require 'date'

module AuthorData
  def load_authors
    file = './json_files/author.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Author.new(element['first_name'], element['last_name']))
      end
    end
    data
  end

  def save_authors
    data = []
    @authors.each do |author|
      data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    File.write('./json_files/author.json', JSON.generate(data))
  end
  
  def list_authors
    @authors.each do |author|
      p "first_name:#{author.first_name} last_name:#{author.last_name}"
    end
  end
 
  def add_author
    puts 'Enter first_name'
    first_name = gets.chomp
    puts 'Enter last_name'
    last_name = gets.chomp
    @authors.push(Author.new(first_name, last_name))
    save_authors
  end
end
