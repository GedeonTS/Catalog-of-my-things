require_relative '../Book/book'
require_relative '../Book/books_handler'
require 'yaml'

describe Book do
  include BooksHandler

  it 'archived is false' do
    book = Book.new('10/08/2020', 'publisher', 'good')
    book.move_to_archive
    p book.archived
    book.archived.should eq false
  end

  it 'archived is true' do
    book = Book.new('26/10/2024', 'publisher', 'bad')
    book.move_to_archive
    p book.archived
    book.archived.should eq true
  end

  it 'archived is false' do
    book = Book.new('10/12/2024', 'publisher', 'good')
    book.move_to_archive
    p book.archived
    book.archived.should eq false
  end
end
