class Transaction < ActiveRecord::Base
  attr_accessible :balance_date, :date, :document_number, :entity_id, :origin, :value, :entity, :description, :import_id, :key
  belongs_to :entity
  belongs_to :import
  validates :key, :uniqueness => true
  validates :date, :description, :document_number, :presence => true
  scope :incoming, where("value > 0")
  scope :outgoing, where("value < 0 AND description != ?", "BB Renda Fixa 200")
  scope :this_month, where("date >= ?", Date.today.at_beginning_of_month)
  before_create { self.key = Digest::MD5.hexdigest(self.date.to_s + self.description + self.document_number + self.value.to_s) }
end
