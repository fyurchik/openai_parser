# frozen_string_literal: true

require_relative 'scraper'
require_relative 'database'
require_relative 'vacancy_database_handler'

class MainApp
  def self.run
    DataBase.new.connect
    CreateVacancies.new.setup_table

    scraper = Scraper.new
    scraper.call
    end 
  end
end

MainApp.run