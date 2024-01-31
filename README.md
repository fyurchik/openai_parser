# OpanAI Scraper

OpanAI Scraper is a Ruby gem built to scrape OpenAI vacancies and store them in a PostgreSQL database.

## How to install and use it locally

### Prerequisites

- Ruby installed on your machine
- PostgreSQL database credentials
- Bundler gem installed (`gem install bundler`)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/fyurchik/openai_parser.git
```

```bash
cd openai_parser
```

2. Install dependencies:

```bash
bundle install
```

3. Create a .env file in the project directory with your PostgreSQL database credentials:

```bash
DATABASE_USERNAME=your_database_username
DATABASE_PASSWORD=your_database_password
DATABASE=your_database_name
```

4. Run the scraper:

```bash
ruby lib/app.rb
```

## Install and Use as a Gem

### Prerequisites

-Ruby installed on your machine

### Installation

1. Install the gem:

```bash
gem install scraper
```

2. Create a Ruby script (e.g., my_scraper.rb) with the following content:

```bash
require 'scraper'

# Run the scraper
Scraper.call
```

3. Execute the script:

```bash
ruby my_scraper.rb
```
