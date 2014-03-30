class Opinion < ActiveRecord::Base
  belongs_to :user, :inverse_of => :opinions
  attr_accessible :comment, :rating, :user, :optitle, :slug

  belongs_to :opinionable, :polymorphic => true

  extend FriendlyId
  friendly_id :optitle, use: :slugged

end
