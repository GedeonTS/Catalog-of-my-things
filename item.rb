require 'date'
class Item
  attr_accessor :genre, :author, :label, :archived

  def initialize(source, publish_date, archived: false)
    @id = Random.rand(1..100)
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def can_be_archived?()
    current_date = Date.today
    total_years = current_date.year - @publish_date.year
    total_years > 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
