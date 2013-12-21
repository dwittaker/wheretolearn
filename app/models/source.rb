class Source < ActiveRecord::Base
  attr_accessible :description, :name, :physaddress, :srctype, :weburl
  has_many :portfolios
end
