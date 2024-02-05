# frozen_string_literal: true

require_relative '../lib/models/vacancy'

class VacancyDatabaseHandler
  attr_writer :scraped_data

  def initialize(scraped_data)
    @scraped_data = scraped_data
  end

  def save_in_db
    @scraped_data.each do |vacancy|
      Vacancy.new(vacancy).save
    end
  rescue StandardError => e
    raise "Failed to save data: #{e.message}"
  end
end
