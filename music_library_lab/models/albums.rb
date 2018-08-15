require_relative('../db/sql_runner.rb')
require('pg')

class Album

  attr_reader :id
  attr_accessor :name, :genre, :artist_id

  def initialize(details)
    @id = details["id"].to_i if details ["id"]
    @name = details["name"]
    @genre = details["genre"]
    @artist_id = details["artist_id"].to_i
  end

  def save()
    sql = " INSERT INTO albums (name, genre, artist_id)
    VALUES ($1, $2, $3)
    RETURNING (id) "
    values = [@name, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums
    SET (name, genre, artist_id) = ($1, $2, $3)
    WHERE id = ($4)"
    values = [@name, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM albums
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    found_artist = SqlRunner.run(sql, values)
    found_artist[0]
  end


  def Album.find_by_id(id)
    sql = "SELECT * FROM albums
    WHERE id = ($1)"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results.first
    found_album = Album.new(album_hash)
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    album_hashes = SqlRunner.run(sql)
    album = album_hashes.map {|album| Album.new(album)}
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql, values)
  end

end
