require 'json'

module BooksHandler
  def store_books(book)
    file = './Book/Books.json'
    File.new('./Book/Books.json', 'w+') unless File.exist?(file)

    data = []

    # books.each do |book|
    data << { id: book.id, publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
              archived: book.archived, genre: book.genre, author: book.author, label: book.label }
    # end
    File.write(file, JSON.generate(data))
  end

  def load_books
    data = []
    file = './Book/Books.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |book|
      new_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['id'],
                          archived: book['archived'])
      new_book.genre = Genre.new(book['genre'])
      new_book.author = Author.new(book['author']['first_name'], book['author']['last_name'])
      new_book.label = Label.new(book['label'])
      data << new_book
    end

    data
  end

  def add_book()
    author_name = my_input("Enter Author's name: ")
    author_family_name = my_input("Enter Author's last name: ")
    author = Author.new(author_name, author_family_name)
    publish_date = my_input("Book\'s publish date: ")
    publisher = my_input("Book\'s publisher: ")
    cover_state = my_input("Book\'s cover state [good, bad]: ")
    genre = Genre.new(my_input("Book\'s genre: "))
    label = Label.new(my_input("Book\'s label: "))
    new_book = Book.new(publish_date, publisher, cover_state)
    new_book.genre = genre
    new_book.label = label
    new_book.author = author
    new_book.move_to_archive
    # @books << new_book
    # @labels << label
    # @genres << genre
    store_labels(label)
    store_genres(genre)
    store_books(new_book)
    add_author(author)
    puts "The book (by #{author_family_name}) has been created successfully ✅"
  end

  def list_books
    puts '.' * 10
    if @books.empty?
      puts 'The books list is empty'
    else
      puts '📚 Books list:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}-[Book] ID: #{book.id} | Publisher: #{book.publisher} | " \
             "Publish date: #{book.publish_date} | Cover state: #{book.cover_state} | Archived: #{book.archived}"
      end
    end
  end
end
