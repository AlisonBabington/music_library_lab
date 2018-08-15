require_relative('../db/sql_runner.rb')
require('pg')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = " INSERT INTO artists (name)
    VALUES ($1)
    RETURNING (id) "
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET name = ($1)
    WHERE id = ($2)"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def find_albums()
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    found_albums = SqlRunner.run(sql, values)
    return found_albums.map {|album| album}
  end

  def delete()
    sql = "DELETE * FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Artist.find_by_id(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    artist_hash = results.first
    found_artist = Artist.new(artist_hash)
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    artist_hashes = SqlRunner.run(sql)
    artists = artist_hashes.map {|artist| Artist.new(artist)}
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql, values)
  end
end
