class Opinion < ActiveRecord::Base
  belongs_to :user, :inverse_of => :opinions
  attr_accessible :comment, :rating, :user

  belongs_to :opinionable, :polymorphic => true


end
