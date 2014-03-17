class Opinion < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comment, :rating

  belongs_to :opinionable, :polymorphic => true
end
