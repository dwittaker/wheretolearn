class Category1 < ActiveRecord::Base
  attr_accessible :cat1cod, :cat1desc
  has_many :category2s
  has_many :subjects
end
