class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    return @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    return song
    # binding.pry
  end

  def self.new_by_name(songname)
    song = create
    song.name = songname
    return song
  end
  
  def self.create_by_name(songname)
    song = create
    song.name = songname
    @@all << song
    song
  end

  def self.find_by_name(songname)
      @@all.find {|name| name.name == songname} #Passes each entry in enum to block. Returns the first for which block is not false. If no object matches, calls ifnone and returns its result when it is specified, or returns nil otherwise.
  end

  def self.find_or_create_by_name(songname)
    if self.find_by_name(songname) == nil
        self.create_by_name(songname)
    else
      return self.find_by_name(songname)
    end
  end

  def self.alphabetical
      @@all.uniq.sort_by {|name| name.name}
  end

  def self.new_from_filename(file)
      song = Song.new
      delete =file.gsub(".mp3", "")
      newsong = delete.split(" - ")
      
      song.name = newsong[1]
      song.artist_name = newsong[0]
      return song
  end

  def self.create_from_filename(file)
      song = new_from_filename(file)
      @@all << song
      return song
  end
  
  def self.destroy_all
    @@all = []
  end
end

# binding.pry
# puts "lol"