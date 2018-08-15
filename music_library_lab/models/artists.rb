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

  def Artist.all()
    sql = "SELECT * FROM artists"
    artist_hashes = SqlRunner.run(sql)
    artists = artist_hashes.map {|artist| Artist.new(artist)}

  end

end
