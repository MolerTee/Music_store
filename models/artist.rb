require_relative('../db/sql_runner')

class Artist

  def initialize (options)
    @id = options['id'].to_i || nil
    @name = options['name']
  end


end