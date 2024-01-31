# OpenAI Scraper

OpenAI Scraper is a Ruby gem designed to scrape OpenAI vacancies and store them in a PostgreSQL database.

## How to Install and Use Locally

### Prerequisites

- Ruby installed on your machine
- PostgreSQL database credentials
- Bundler gem installed (`gem install bundler`)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/fyurchik/openai_parser.git
   cd openai_parser
   ```

2. **Install dependencies:**

   ```bash
   bundle install
   ```

3. **Create a `.env` file in the project directory with your PostgreSQL database credentials:**

   ```env
   DATABASE_USERNAME=your_database_username
   DATABASE_PASSWORD=your_database_password
   DATABASE=your_database_name
   ```

4. **Run the scraper:**

   ```bash
   ruby lib/app.rb
   ```

## Install and Use as a Gem

### Prerequisites

- Ruby installed on your machine

### Installation

1. **Make sure that u created a `.env` file with:**

   ```env
   DATABASE_USERNAME=your_database_username
   DATABASE_PASSWORD=your_database_password
   DATABASE=your_database_name
   ```

2. **Install the gem:**

   ```bash
   gem install scraper
   ```

3. **Create a Ruby script (e.g., `my_scraper.rb`) with the following content:**

   ```ruby
   require 'scraper'

   # Run the scraper
   Scraper.call
   ```

4. **Execute the script:**

   ```bash
   ruby my_scraper.rb
   ```

   Or, open IRB console:

   ```bash
   irb
   ```

   And call gem:

   ```bash
   irb(main):001:0> require "vacancy_pars"
   => true
   irb(main):002:0> Scraper.call
   ```
