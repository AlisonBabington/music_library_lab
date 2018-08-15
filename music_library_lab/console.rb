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

binding.pry
nil
