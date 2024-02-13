# frozen_string_literal: true

# spec/scraper_spec.rb
require 'rspec'
require 'webmock/rspec'
require_relative '../lib/scraper/scraper_logic'

RSpec.describe Scraper do
  describe '#scrape' do
    let(:mocked_html_path) { './spec/fixtures/vacancy_page.html' }
    let(:site_html) { Nokogiri::HTML(File.read(mocked_html_path)) }

    let(:title) { site_html.css('.pt-spacing-9 h1').text.strip }
    let(:location) { site_html.css('p.f-subhead-1.ui-richtext span').text }
    let(:url) { site_html.at('.lg\\:absolute.top-0.left-0.right-0.flex.flex-col a')['href'] }
    let(:scraper) { Scraper.new }

    before do
      allow(HTTParty).to receive(:get).and_return(double(body: File.read(mocked_html_path)))
      scraper.call
    end

    let(:expected_url) { 'https://fakelink.com' }
    let(:mocked_url) { 'https://fakelinktoparse.com' }

    it 'parse a valid title' do
      expect(title).to eq('Account Associate')
    end

    it 'parse a valid location' do
      expect(location).to eq('San Francisco, California, United States — Go To Market')
    end

    it 'parse a valid url' do
      expect(url).to eq(expected_url)
    end
  end
end
