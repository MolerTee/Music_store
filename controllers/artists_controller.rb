require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/artist' )
require_relative( '../models/album' )

get '/artist' do
  @artists = Artist.all()
  erb(:"artists/artist")
end

get '/artist/create' do
  @artists = Artist.all()
  erb(:"artists/artist_create")
end

get '/artist/update' do
  @artists = Artist.all()
  erb(:"artists/artist_update")
end

get '/artist/search' do
  @artists = Artist.all()
  erb(:"artists/artist_search")
end

