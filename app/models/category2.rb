class Category2 < ActiveRecord::Base
  belongs_to :category1
  attr_accessible :cat2cod, :cat2desc, :category1_id
  has_many :category3s
  has_many :subjects

  resourcify
end
