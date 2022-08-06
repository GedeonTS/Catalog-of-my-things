require 'date'
require_relative './classes/game'

describe Game do
  context 'Game class' do
    it 'should have a multiplayer value' do
      game = Game.new('Mary', '12/12/2012')
      expect(game.multiplayer).to eq('Mary')
    end

    it 'should have a last_played date' do
      game = Game.new('Mary', '12/12/2012')
      expect(game.last_played_at).to eq('12/12/2012')
    end
  end
end
