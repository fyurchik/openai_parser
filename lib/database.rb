require 'active_record'
require 'dotenv/load'

class DataBase 
  def self.connect
    setup_db_connection
  end

  private

  def self.setup_db_connection
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      host: 'localhost',
      username: 'yuraf',
      password: 'yura12',
      database: 'new_database'
    )
  end
end