class Category3 < ActiveRecord::Base
  belongs_to :category2
  attr_accessible :cat3cod, :cat3desc, :category2_id
  has_many :subjects
end
