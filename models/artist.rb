require_relative('../db/sql_runner')

class Artist

  attr_reader( :name , :id)

  def initialize (options)
    @id = options['id'].to_i || nil
    @name = options['name']
  end
 
  def save ()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *; "
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    all_artists = SqlRunner.run(sql).map { |artist| Artist.new(artist) }
    return all_artists
  end

  def self.find_by_id(id)
    sql = "
      SELECT * FROM artists
      WHERE id = #{id};"
    artists = SqlRunner.run(sql)
    result = Artist.new(artists.first)
    return result
  end

  def self.find_by_name(name)
    sql = "
      SELECT * FROM artists
      WHERE name = '#{name}';"
    artist = SqlRunner.run(sql) || []
    return artist.map { |a| Artist.new(a) }
  end

  def self.destroy(id)
     sql = "DELETE FROM artists where id = #{id}"
     SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end

  def self.update(id)
    sql = "UPDATE artists SET (name) = ('#{name}') WHERE id = #{id};"
    SqlRunner.run(sql)
  end
end