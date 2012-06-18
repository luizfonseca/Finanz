class Entity < ActiveRecord::Base
  attr_accessible :name
  has_many :transactions, :dependent => :destroy
end
