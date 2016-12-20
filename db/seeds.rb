require_relative ('../models/album')
require_relative ('../models/artist')
require ('pry')

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new('name' => 'Led Zeppelin')

artist1.save()

artist2 = Artist.new('name' => 'Genesis')

artist2.save()

album1 = Album.new('name' => 'how the west was won' , 'quantity' => 10 , 'genre' => 'rock' ,'artist_id' => 1)

album1.save()

album2 = Album.new('name' => 'Led Zeppelin IV' , 'quantity' => 10 , 'genre' => 'rock' , 'artist_id' => 1)

album2.save()

album3 = Album.new('name' => 'Invisible Touch' , 'quantity' => 10 , 'genre' => 'rock' , 'artist_id' => 2)

album3.save()




