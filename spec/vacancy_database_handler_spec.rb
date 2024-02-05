# spec/vacancy_database_handler_spec.rb

require 'spec_helper'
require_relative '../lib/vacancy_database_handler'

RSpec.describe VacancyDatabaseHandler do
  describe '#initialize' do
    context 'when not raising an error' do 
      let(:handler) { VacancyDatabaseHandler.new({title: "something", location: "somewhere"}) }
      it 'initializes without errors' do
        expect { handler }.to_not raise_error
      end
    end

    context 'when raising an error'  do 
      let(:handler) { VacancyDatabaseHandler.new }
      it 'initializes with errors' do
        expect { handler }.to raise_error(ArgumentError)
      end
    end 
  end

  describe '#save_in_db' do
    let(:scraped_data) do
      [
        { title: 'Software Engineer1', location: 'Remote1' },
        { title: 'Data Scientist2', location: 'New York2' },
        { title: 'Software Engineer1', location: 'LA' },
        { title: 'Data Scientist2', location: 'LA' }
      ]
    end
    let(:handler) { VacancyDatabaseHandler.new(scraped_data) }
    it 'saves scraped data properly' do
      vacancy_double = double('vacancy', save: true)

      allow(Vacancy).to receive(:new).and_return(vacancy_double)

      handler.save_in_db

      scraped_data.each do |vacancy_data|
        expect(Vacancy).to have_received(:new).with(vacancy_data)
      end
      expect(vacancy_double).to have_received(:save).exactly(scraped_data.length).times
    end

    context 'when saving to the database fails' do
      let(:error_message) {'Failed to save to the database'}
      
      it 'raises an error' do
        error_double = double('vacancy')
        allow(error_double).to receive(:save).and_raise(RuntimeError, error_message)

        allow(Vacancy).to receive(:new).and_return(error_double)

        expect { handler.save_in_db }.to raise_error(RuntimeError, "Failed to save data: #{error_message}")
      end
    end
  end
end
