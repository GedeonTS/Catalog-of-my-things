require_relative '../genre/genre'
require_relative '../item'

describe 'Genre Class' do
  before :each do
    @genre = Genre.new('Pop')
    @item = Item.new('2000-2-2')
  end
  it 'should be an instance of genre class' do
    expect(@genre).to be_an_instance_of(Genre)
  end
  it 'should be an instance of item class' do
    expect(@item).to be_an_instance_of(Item)
  end
  it 'should return name after recieving an instance' do
    expect(@genre.name).to eq('Pop')
  end

  it 'should recieve data after adding an item' do
    @genre.add_item(@item)
    expect(@genre.items.length).to eq 1
  end
end
