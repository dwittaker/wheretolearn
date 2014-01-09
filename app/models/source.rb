class Source < ActiveRecord::Base
  attr_accessible :description, :name, :physaddress, :srctype, :weburl
  has_many :portfolios
  has_many :subjects, through: :portfolios
  has_many :contenttags, :as => :taggable
end
