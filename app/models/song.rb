class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_content=(content)
    self.notes <<  Note.find_or_create_by(content: content)
  end

  def note_content
    self.notes ? self.notes[0] : nil
  end
end
