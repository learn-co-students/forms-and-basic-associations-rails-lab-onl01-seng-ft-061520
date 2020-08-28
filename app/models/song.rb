class Song < ActiveRecord::Base
  # add associations here

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # def note_content=(content)  

  #     @note = Note.create(content: c)
  #     self.notes << @note

  # end

  def note_content=(content)

    content.each do |c|
      if c != ""
      @note = Note.create(content: c)

      self.notes << @note
      end
    end
    # binding.pry
  end

  def note_content
     @note
  end






  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end
  # user types in artist & it's passed in as a params so uses artist_name


# user selects from drop down so I don't even need lines 21-27 just use the genre id
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end


end
