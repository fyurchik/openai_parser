# frozen_string_literal: true

require 'active_record'

class Vacancy < ActiveRecord::Base
end

class CreateVacancies < ActiveRecord::Migration[5.2]
  def setup_table
    change unless ActiveRecord::Base.connection.table_exists?('vacancies')
  end

  private

  def change
    create_table :vacancies do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :location

      t.timestamps
    end
  end
end
