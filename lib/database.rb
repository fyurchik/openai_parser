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
      username: ENV['DATABASE_USERNAME'] ,
      password: ENV['DATABASE_PASSWORD'],
      database: ENV['DATABASE']
    )
  end
end