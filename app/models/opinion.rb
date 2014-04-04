class Opinion < ActiveRecord::Base
  belongs_to :user, :inverse_of => :opinions
  attr_accessible :comment, :rating, :user, :optitle, :slug
    delegate :username, :to => :user

  belongs_to :opinionable, :polymorphic => true

  extend FriendlyId
  friendly_id :optitle, use: :slugged

  include PgSearch
  multisearchable :against => [:comment, :rating, :optitle]

end
