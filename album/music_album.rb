require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :archived, :id

  def initialize(publish_date, _archived, on_spotify, id: nil)
    super(publish_date, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def self.read_file(genres)
    data_arr = []
    if File.empty?('files/music_album.json')
      JSON.parse(File.read(MusicAlbum.path)).each do |element|
        genre = genres.select { |g| g.id == element['genre_id'] }[0]
        music_album = MusicAlbum.new(element['publish_date'],
                                     element['archived'],
                                     element['on_spotify'],
                                     id: element['id'])
        music_album.add_genre(genre)
        data_arr << music_album
      end
    end
    data_arr
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << {
        id: d.id,
        publish_date: d.publish_date,
        archived: d.archived,
        on_spotify: d.on_spotify,
        genre_id: d.genre.id
      }
    end
    File.write(MusicAlbum.path, JSON.generate(data_arr))
  end
end
