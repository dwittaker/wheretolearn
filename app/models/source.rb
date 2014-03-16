class Source < ActiveRecord::Base
  attr_accessible :description, :name, :physaddress, :weburl, :sourcetype_id
  has_many :portfolios, :inverse_of => :source
  has_many :subjects, through: :portfolios
  has_many :contenttags, :as => :taggable
  belongs_to :sourcetype, :inverse_of => :sources
  has_many :usedmethods, :as => :deliverable

  attr_accessible :usedmethods_attributes

  accepts_nested_attributes_for :usedmethods , :reject_if => lambda { |a| a[:deliverymethod_id].blank? }, :allow_destroy => true

  validates_associated :usedmethods

  require "acts-as-taggable-on"
  acts_as_taggable

  attr_accessible :tag_list


end
