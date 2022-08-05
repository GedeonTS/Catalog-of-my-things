require_relative '../Label/label.rb'
require_relative '../Label/label_handler.rb'
require_relative '../Book/book.rb'
require 'yaml'

describe Label do
  include LabelsHandler
  it 'item should be pushed to array' do
    label = Label.new('label')
    book = Book.new('20/10/2010', 'publisher', 'good')
    label.add_item(book)
    label.items.should eq [book]
  end

  it "item\'s label will be set to label" do
    label = Label.new('label')
    book = Book.new('20/10/2010', 'publisher', 'good')
    label.add_item(book)
    book.label.should eq 'label'
  end
end