require 'httparty'
require 'nokogiri'
require_relative '../config'
require_relative 'database'
require_relative 'vacancy_database_handler'

class Scraper
  def self.call
    DataBase.connect

    unless ActiveRecord::Base.connection.table_exists?('vacancies')
      CreateVacancies.new.change
    end

    scraped_data = scrape
    
    vacancyDbHandler = VacancyDatabaseHandler.new(scraped_data)
    vacancyDbHandler.save_in_db
  end

  private

  def self.scrape
    start_url = URLS::START_URL
    response = HTTParty.get(start_url)
    doc = Nokogiri::HTML(response.body)

    all_hrefs = doc.css('ul[aria-label="All teams roles"] li a').map { |link| link['href'] if link['href'].include?("careers")}
    all_hrefs.compact!

    scraped_vacancies = []

    all_hrefs.each do |href|
      new_url = URLS::BASE_URL + href
      response = HTTParty.get(new_url)
      doc = Nokogiri::HTML(response.body)

      title = doc.css('.pt-spacing-9 h1').text
      location = doc.css('p.f-subhead-1.ui-richtext span').text
      url = doc.at('.lg\\:absolute.top-0.left-0.right-0.flex.flex-col a')['href']
      description = doc.at('.ui-description.ui-richtext').to_html

      scraped_vacancies << {title: title, location: location,url: url, description: description}
    end

    return scraped_vacancies
  end
end
