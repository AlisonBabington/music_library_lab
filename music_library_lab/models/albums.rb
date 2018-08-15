require_relative('../db/sql_runner.rb')
require('pg')

class Albums

  attr_reader :id
  attr_accessor :name, :genre, :artist_id

  def initialize(details)
    @id = details["id"] if details ["id"]
    @name = details["name"]
    @genre = details["genre"]
    @artist_id = details["artist_id"]
  end

end
