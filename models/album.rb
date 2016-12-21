require_relative('../db/sql_runner')

class Album
  attr_accessor(  :artist_id )
  attr_reader( :name, :genre, :quantity, :id )

  def initialize (options)
    @id = options['id'].to_i || nil
    @name = options['name']
    @genre = options['genre']
    @quantity = options['quantity']
    @artist_id = options['artist_id'].to_i
  end

  def save ()
    sql = "INSERT INTO albums (name , genre , quantity, artist_id ) VALUES ('#{@name}' , '#{@genre}', #{@quantity} , #{@artist_id} ) returning *; "
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM albums;"
    all_albums = SqlRunner.run(sql).map { |album| Album.new(album) }
    return all_albums
  end

  def self.find_by_id(id)
    sql = "
      SELECT * FROM albums
      WHERE id = #{id};"
    albums = SqlRunner.run(sql)
    result = Album.new(albums.first)
    return result
  end

  def self.destroy(id)
     sql = "DELETE FROM albums where id = #{id}"
     SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end

  def self.artist(id)
    sql = "SELECT name FROM artists WHERE id = #{id};"
    artist = SqlRunner.run(sql)[0]
    return artist
  end

  def self.artist_name(id)
    sql = "SELECT artist.name FROM albums WHERE id = #{id};"
    artist_name = SqlRunner.run(sql)[0]
    return artist_name
  end

  def self.update(options)
    sql = "UPDATE albums SET (name, genre, quantity, artist_id) = ('#{options['name']}','#{options['genre']}',#{options['quantity']}, #{options['artist_id']}) WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

end