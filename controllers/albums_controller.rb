require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/artist' )
require_relative( '../models/album' )

get '/album' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:"albums/album")
end

post '/album' do

  artist_options = { "name" => params[:artist_name] }
  @artist = Artist.new(artist_options)
  
  search_array =   Artist.find_by_name(params[:artist_name].to_s)

  if search_array.first == nil
    search_array = [@artist]
    @artist.save()
  end

  @artist = search_array.first

  album_options = { "name" => params[:album_name], "genre" => params[:genre], "quantity" => params[:quantity].to_i, "artist_id" => @artist.id}
  @album = Album.new(album_options)
  
  @album.save()
  @artists = Artist.all()
  @albums = Album.all()
  erb(:"albums/album")
end

get'/album/create' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:"albums/album_create")
end

get '/album/update' do
  @artists = Artist.all()
  @albums = Album.all()
  erberb(:"albums/album_update")
end

get '/album/search' do
  @artists = Artist.all()
  @albums = Album.all()
  erberb(:"albums/album_search")
end

