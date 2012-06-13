class Transaction < ActiveRecord::Base
  attr_accessible :balance_date, :date, :document_number, :entity_id, :origin, :value

end
