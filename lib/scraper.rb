require 'httparty'
require 'nokogiri'

class Scraper
 
  def self.call
    scrape
  end

  private

  def self.scrape
    start_url = 'https://openai.com/careers/search'
    response = HTTParty.get(start_url)
    doc = Nokogiri::HTML(response.body)
  
    all_hrefs = doc.css('ul[aria-label="All teams roles"] li a').map { |link| link['href'] if link['href'].include?("careers")}
    all_hrefs.compact!
    
    all_hrefs.each do |href|
      new_url = 'https://openai.com' + href
      response = HTTParty.get(new_url)
      doc = Nokogiri::HTML(response.body)
  
      title = doc.css('.pt-spacing-9 h1').text
      location = doc.css('p.f-subhead-1.ui-richtext span').text
      url = doc.at('.lg\\:absolute.top-0.left-0.right-0.flex.flex-col a')['href']
      description = doc.at('.ui-description.ui-richtext').to_html
  
      Vacancy.new(title: title, location: location, url: url, description: description).save
    end
  end
end