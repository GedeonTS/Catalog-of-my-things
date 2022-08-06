class Author
  attr_accessor :items
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1..100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
    item.author = self
  end
end
