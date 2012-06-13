class Import < ActiveRecord::Base
  require 'csv'
  attr_accessible :file
  
  mount_uploader :file, CsvUploader

  after_create :parse_csv_file



  def parse_csv_file
    file = File.read(self.file)
    csv = CSV.parse(file, headers: true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
    end
    logger.info row
  end
end
