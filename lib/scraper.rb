# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
require_relative 'database'
require_relative 'vacancy_database_handler'

class Scraper
  BASE_URL = 'https://openai.com'
  START_URL = 'https://openai.com/careers/search'
  
  def initialize
    @database = DataBase.new
    @table = CreateVacancies.new
    @vacany_handler = VacancyDatabaseHandler.new
  end
  
  def call
    @database.connect
    @table.setup_table
    scraped_data = scrape
    @vacany_handler.save_in_db(scraped_data)
  end

  private

  def scrape
    start_url = START_URL
    response = HTTParty.get(start_url)
    doc = Nokogiri::HTML(response.body)

    all_hrefs = doc.css('ul[aria-label="All teams roles"] li a').map do |link|
      link['href'] if link['href'].include?('careers')
    end
    all_hrefs.compact!

    scraped_vacancies = []

    all_hrefs.each do |href|
      new_url = BASE_URL + href
      response = HTTParty.get(new_url)
      doc = Nokogiri::HTML(response.body)

      title = doc.css('.pt-spacing-9 h1').text
      location = doc.css('p.f-subhead-1.ui-richtext span').text
      url = doc.at('.lg\\:absolute.top-0.left-0.right-0.flex.flex-col a')['href']
      description = doc.at('.ui-description.ui-richtext').to_html

      scraped_vacancies << { title: title, location: location, url: url, description: description }
    end

    scraped_vacancies
  end
end
