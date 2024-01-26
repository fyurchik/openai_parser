require 'rspec'
require 'httparty'
require 'nokogiri'
require 'active_record'

require_relative '../lib/scraper'
require_relative '../lib/database'
require_relative '../lib/models/vacancy'

describe Scraper do
  describe '.scrape' do
    let(:site_html) { File.read('./vacancy_page.html') }
    let(:saved_link) { 'https://boards.greenhouse.io/openai/jobs/5059976004#app' }

    before do
      allow(HTTParty).to receive(:get).and_return(double(body: site_html))
    end

    it 'should parse valid info about 1 vacancy' do
      DataBase.connect

      unless ActiveRecord::Base.connection.table_exists?('vacancies')
        CreateVacancies.new.change
      end
      
      Scraper.call

      vacancy = Vacancy.first
      expect(vacancy.title).to eq('Account Associate')
      expect(vacancy.location).to eq('San Francisco, California, United States — Go To Market')
      expect(vacancy.url).to eq(saved_link)
    end
  end
end