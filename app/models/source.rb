class Source < ActiveRecord::Base
  attr_accessible :description, :name, :physaddress, :weburl, :sourcetype_id
  has_many :portfolios, :inverse_of => :source
  has_many :subjects, through: :portfolios
  has_many :contenttags, :as => :taggable
  belongs_to :sourcetype, :inverse_of => :sources
  has_many :usedmethods, :as => :deliverable


end
