class Subject < ActiveRecord::Base
  attr_accessible :subject_id, :name, :description, :purpose, :complexity, :category1_id, :category2_id, :category3_id, :avgtimetolearn
  has_many :subject_modules
  has_many :sources, through: :portfolios
  belongs_to :category1
  	delegate :cat1cod, :cat1desc, :to => :category1
  belongs_to :category2
  	delegate :cat2cod, :cat2desc, :to => :category2
  belongs_to :category3
	delegate :cat3cod, :cat3desc, :to => :category3
  has_many :contenttags, :as => :taggable 


end
