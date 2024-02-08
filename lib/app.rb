# frozen_string_literal: true

require_relative 'scraper'
require_relative 'database'
require_relative 'vacancy_database_handler'

class Main
  def self.run
    database = DataBase.new
    table = CreateVacancies.new
    vacancy_handler = VacancyDatabaseHandler.new

    scraper = Scraper.new(database, table, vacancy_handler)
    scraper.call
  end
end

Main.run