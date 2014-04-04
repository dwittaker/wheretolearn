class Source < ActiveRecord::Base
  attr_accessible :description, :name, :physaddress, :weburl, :sourcetype_id, :slug

    delegate :stdesc, :to => :sourcetype
  has_many :portfolios, :inverse_of => :source
  has_many :subjects, through: :portfolios
  has_many :contenttags, :as => :taggable
  belongs_to :sourcetype, :inverse_of => :sources
  has_many :usedmethods, :as => :deliverable
  has_many :opinions, :as => :opinionable
  attr_accessible :usedmethods_attributes

  accepts_nested_attributes_for :usedmethods , :reject_if => lambda { |a| a[:deliverymethod_id].blank? }, :allow_destroy => true

  belongs_to :created_by, class_name: "User" #, :inverse_of => :sources
  belongs_to :updated_by, class_name: "user" #, :inverse_of => :sources

  def updater(user)
    self.updated_by_id = user.id
    self.save
  end

  def srcname
    name
  end

  validates_associated :usedmethods

  require "acts-as-taggable-on"
  acts_as_taggable

  attr_accessible :tag_list

  extend FriendlyId
  friendly_id :name, use: :slugged

  include PgSearch
  multisearchable :against => [:description, :name, :physaddress, :weburl]
  pg_search_scope :search_by_basic, :against => [:description, :name, :physaddress, :weburl]

  def should_generate_new_friendly_id?
    true
    #new_record?
  end
end
