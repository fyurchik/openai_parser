Gem::Specification.new do |s|
  s.name        = "scraper"
  s.version     = "0.1.0"
  s.summary     = "Scraper Gem"
  s.description = "A gem for scraping OpenAI vacancies"
  s.authors     = ["Yura Fenyn"]
  s.email       = "jyrafenun@gmail.com"
  s.files       = Dir.glob("lib/**/*.rb") + ["config.rb"]
  s.homepage    = "https://rubygems.org/gems/hola"
  s.license     = "MIT"
  s.require_path = "lib"

  s.add_runtime_dependency 'activerecord'
  s.add_runtime_dependency 'dotenv'
  s.add_runtime_dependency 'httparty'
  s.add_runtime_dependency 'nokogiri'
  s.add_runtime_dependency 'pg'
end