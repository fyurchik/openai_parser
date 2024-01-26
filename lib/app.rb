require_relative 'models/vacancy'
require_relative 'scraper'
require_relative 'database'

DataBase.connect

unless ActiveRecord::Base.connection.table_exists?('vacancies')
  CreateVacancies.new.change
end

Scraper.call

Vacancy.all.each do |vacancy|
  puts vacancy.title
end