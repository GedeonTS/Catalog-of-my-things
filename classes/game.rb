require_relative '../item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(player, last_played)
    super(id, publish_date)
    @multiplayer = player
    @last_played_at = last_played
  end

  def can_be_archived?
    super || (Date.today.year - @last_played_at.year) > 2
  end
end
