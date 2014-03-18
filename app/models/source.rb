class Source < ActiveRecord::Base
  attr_accessible :description, :name, :physaddress, :weburl, :sourcetype_id, :slug
  has_many :portfolios, :inverse_of => :source
  has_many :subjects, through: :portfolios
  has_many :contenttags, :as => :taggable
  belongs_to :sourcetype, :inverse_of => :sources
  has_many :usedmethods, :as => :deliverable
  has_many :opinions, :as => :opinionable
  attr_accessible :usedmethods_attributes

  accepts_nested_attributes_for :usedmethods , :reject_if => lambda { |a| a[:deliverymethod_id].blank? }, :allow_destroy => true

  validates_associated :usedmethods

  require "acts-as-taggable-on"
  acts_as_taggable

  attr_accessible :tag_list

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    true
    #new_record?
  end
end
