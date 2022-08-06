require_relative './classes/author'
require_relative './item'

describe Author do
  it 'should have a name' do
    author = Author.new('Kwambiee', 'Joyous')
    expect(author.first_name).to eq('Kwambiee')
    expect(author.last_name).to eq('Joyous')
  end

  it 'Should have an empty items array' do
    author = Author.new('kwambiee', 'Joyous')
    expect(author.items).to eq([])
  end
end
