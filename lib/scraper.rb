# frozen_string_literal: true

require_relative 'scraper/database'
require_relative 'scraper/vacancy_database_handler'
require_relative 'scraper/scraper_logic'

class MainApp
  def self.run
    DataBase.new.connect
    CreateVacancies.new.setup_table

    Scraper.new.call
  end
end
