class Transaction < ActiveRecord::Base
  attr_accessible :balance_date, :date, :document_number, :entity_id, :origin, :value, :entity, :description, :import_id
  belongs_to :entity
  validates :document_number, :uniqueness => true
end
