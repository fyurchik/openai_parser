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
  rescue ActiveRecord::ConnectionNotEstablished => e
    puts "Failed to establish a database connection: #{e.message}"
  end
end