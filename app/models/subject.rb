class Subject < ActiveRecord::Base
  attr_accessible :subject_id, :name, :description, :purpose, :complexity, :category1, :category2, :category3, :avgtimetolearn
  has_many :subject_modules
  has_many :sources, through: :portfolios
  belongs_to :category1
  belongs_to :category2
  belongs_to :category3
  has_many :contenttags, :as => :taggable 
end
