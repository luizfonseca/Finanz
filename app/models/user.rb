class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :imports
  has_many :transactions, :through => :imports

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
