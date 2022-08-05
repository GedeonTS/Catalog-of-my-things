require 'date'
class Item
  attr_accessor :archived, :id
  attr_reader :label, :genre, :author

  def initialize(publish_date, archived: false, id: nil)
    @id = id || Random.rand(1..100)
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end
  
  def can_be_archived?()
    current_date = Date.today
    total_years = current_date.year - @publish_date.year
    total_years > 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre.name
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = { first_name: author.first_name, last_name: author.last_name }
    author.items << self unless author.items.include?(self)
  end

  def label=(label)
    @label = label.name
    label.items << self unless label.items.include?(self)
  end
end
