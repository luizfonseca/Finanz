# coding: utf-8
class Import < ActiveRecord::Base
  require 'csv'
  attr_accessible :file, :user_id, :user
  belongs_to :user
  has_many :transactions, :dependent => :destroy
  validates :user_id, :presence => true
  after_create :parse_file

  def parse_file
    Time.zone = "Brasilia"
    CSV.parse(self.file, :headers => true).each do |row|
      next if row[4] == "0"
      history = parse_history row[2]
      entity = history[:entity_name] ? Entity.find_or_create_by_name(history[:entity_name]) : nil
      regex2 = /(\d{2})\/(\d{2})\/(\d{4})/
      date = Time.parse("#{row[0][regex2, 2]}/#{row[0][regex2, 1]}/#{row[0][regex2, 3]} #{history[:hour]}")
      Transaction.create(
        :date => date, 
        :entity => entity, 
        :description => row[2],
        :document_number => row[4],
        :value => row[5].to_f,
        :import_id => self.id
      )
    end
  end

  def parse_history history
    entity_name = history[/[\d]+[\s]+([A-Z][A-Z0-9\s]+)/, 1]
    {:entity_name => entity_name ? entity_name.titleize : nil, :hour => history[/\d\d:\d\d/]}
  end

end
