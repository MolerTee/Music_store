require_relative('../db/sql_runner')

class Album

  def initialize (options)
    @id = options['id'].to_i || nil
    @name = options['name']
    @genre = options['genre']
    @quantity = options['quantity']
    @artist_id = otions['artist_id']
  end

  def save ()
    sql = "INSERT INTO albums (name , genre , quantity ) VALUES ('#{@name}' , '#{@genre}', #{@quantity}, ) returning *; "
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all()
    sql = "
      SELECT * FROM albums;
    "
    all_albums = SqlRunner.run(sql).map { |album| Album.new(album) }
    return all_albums
  end

  def self.find_by_id(id)
    sql = "
      SELECT * FROM albums
      WHERE id = #{id};
    "
    album = SqlRunner.run(sql)[0]
    return album
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def self.artist_name(id)
    sql = "SELECT artist.name FROM albums WHERE id = #{id};"
    artist_name = SqlRunner.run(sql)[0]
    return artist_name
  end





end