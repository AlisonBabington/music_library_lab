require('pry-byebug')
require_relative('models/albums.rb')
require_relative('models/artists.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "The Beatles"
  })

artist2 = Artist.new({
  "name" => "Bob Dylan"
  })

artist3 = Artist.new({
  "name" => "The xx"
  })

artist1.save()
artist2.save()
artist3.save()

artists = Artist.all()

album1 = Album.new({
  "name" => "Blood on the Tracks",
  "genre" => "Folk Rock",
  "artist_id" => artist2.id
  })

album2 = Album.new({
  "name" => "Blonde on Blonde",
  "genre" => "Folk Rock",
  "artist_id" => artist2.id
  })

album3 = Album.new({
  "name" => "Let it Be",
  "genre" => "Pop",
  "artist_id" => artist1.id
  })

album4 = Album.new({
  "name" => "xx",
  "genre" => "Indie Pop",
  "artist_id" => artist3.id
  })

album1.save()
album2.save()
album3.save()
album4.save()

albums = Album.all()

binding.pry
nil
