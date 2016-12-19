require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( 'models/artist' )
require_relative( 'models/album' )

get '/album' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:album)
end

get'album/create' do
  @artists = Artist.all()
  @albums = Album.all()
end

get '/album/update' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:album_update)
end

get '/album/search' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:album_search)
end

