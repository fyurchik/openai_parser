# frozen_string_literal: true

require_relative '../lib/models/vacancy'

class VacancyDatabaseHandler
  def save_in_db(data)
    data.each do |vacancy|
      Vacancy.new(vacancy).save
    end
  rescue StandardError => e
    raise "Failed to save data: #{e.message}"
  end
end
