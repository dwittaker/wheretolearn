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

  def ttlname
    name
  end

  def srchtitle
    name
  end


  def srchtext
    description
  end

  def clstype
    "Source"
  end

  def pagetitle
    name
  end


  validates_associated :usedmethods

  validates :name,
            :presence => true,
            :uniqueness => true,

            :length => { :maximum => 50, :minimum => 3 }

  validates :description,
            :presence => true,

            :length => { :maximum => 700, :minimum => 3 }

  require "acts-as-taggable-on"
  acts_as_taggable

  attr_accessible :tag_list

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    true
    #new_record?
  end

  include PgSearch
  multisearchable :against => [:description, :name, :physaddress, :weburl]
  pg_search_scope :search_by_basic, :against => [:description, :name, :physaddress, :weburl],
                  :associated_against => {:sourcetype => :stdesc, :opinions => :optitle}


  resourcify
end
