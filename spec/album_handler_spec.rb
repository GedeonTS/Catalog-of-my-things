require_relative '../album/music_album'

describe 'Music Album Class' do
  it 'should check if an object is an  instance of MusicAlbum' do
    expect(@album).to be_an_instance_of(MusicAlbum)
  end

  before :each do
    @album = MusicAlbum.new('2022-01-01', true, true)
  end

  it 'should return correct published date' do
    expect(@album.publish_date.year).to be(2022)
  end

  it 'should return correct spotify value' do
    expect(@album.on_spotify).to eq true
  end
end
