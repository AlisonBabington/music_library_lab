require('pry-byebug')
require_relative('models/albums.rb')
require_relative('models/artists.rb')

artist1 = Artist.new({
  "name" => "The Beatles"
  })

artist2 = Artist.new({
  "name" => "Bob Dylan"
  })

artist3 = Artist.new({
  "name" => "The xx"
  })

# artist1.save()
# artist2.save()
# artist3.save()

artists = Artist.all()

album1 = Album.new({
  "name" => "Blood on the Tracks",
  "genre" => "Folk Rock",
  "artist_id" => "2"
  })

album2 = Album.new({
  "name" => "Blonde on Blonde",
  "genre" => "Folk Rock",
  "artist_id" => "2"
  })

album3 = Album.new({
  "name" => "Let it Be",
  "genre" => "Pop",
  "artist_id" => "1"
  })

album4 = Album.new({
  "name" => "xx",
  "genre" => "Indie Pop",
  "artist_id" => "3"
  })

# album1.save()
# album2.save()
# album3.save()

albums = Album.all()

binding.pry
nil
