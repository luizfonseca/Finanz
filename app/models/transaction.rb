class Transaction < ActiveRecord::Base
  attr_accessible :balance_date, :date, :document_number, :entity_id, :origin, :value, :entity, :description, :import_id
  belongs_to :entity
  belongs_to :import
  validates :document_number, :uniqueness => true
  scope :incoming, where("value > 0")
  scope :outgoing, where("value < 0 AND description != ?", "BB Renda Fixa 200")
  scope :this_month, where("date >= ?", Date.today.at_beginning_of_month)
end
