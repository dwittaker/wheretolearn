class Subject < ActiveRecord::Base
  attr_accessible :subject_id, :name, :description, :purpose, :complexity, :category1, :category2, :category3, :avgtimetolearn
  has_many :subject_modules
end
