class UsersRole < ActiveRecord::Base
  after_create :setupdateinfo

  attr_accessible :role_id, :user_id, :created_at, :created_by_id

  belongs_to :role, :inverse_of => :users_roles
  belongs_to :user, :inverse_of => :users_roles

  def setupdateinfo
    self.created_at = DateTime.now
    self.save!
  end
end