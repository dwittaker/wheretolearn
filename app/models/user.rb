class User < ActiveRecord::Base
  rolify :before_add => :before_add_method
  before_create { self.add_role :member}

  def before_add_method(role)
    # do something before it gets added
  end

  #roles_attribute :roles_mask



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:facebook, :twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  # attr_accessible :title, :body


  has_many :opinions


  has_many :portfolios, foreign_key: 'created_by_id' #, :inverse_of => :user
  has_many :updated_portfolios, foreign_key: 'updated_by_id' #, :inverse_of => :user


  has_many :sources, foreign_key: "created_by_id"#, :inverse_of => :user
  has_many :updated_sources, foreign_key: "updated_by_id"


  has_many :subjects, foreign_key: 'created_by_id' #, :inverse_of => :user
  has_many :updated_subjects, foreign_key: 'updated_by_id' #, :inverse_of => :user


  has_many :users_roles, :inverse_of => :user


  attr_accessible :role_ids
  attr_accessible :roles_attributes
  attr_accessible :users_roles_attributes

  accepts_nested_attributes_for :roles, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :users_roles
  #has_and_belongs_to_many :roles, :join_table => :users_roles
  ##has_and_belongs_to_many :roles, :through => :usersroles

  #has_many :roles, as :created_users_roles, foreign_key: 'created_by_id' #, :inverse_of => :user
  #has_many :roles, as :updated_users_roles, foreign_key: 'updated_by_id' #, :inverse_of => :user

  #roles :admin, :guest, :member, :sourcemgr, :subjectmgr

=begin
  has_many :created_subject_modules, :foreign_key => 'created_by_id', :inverse_of => :user
  has_many :updated_subject_modules, :foreign_key => 'updated_by_id', :inverse_of => :user
=end


  def updater(user)
   # self.updated_by_id = user.id

    ur = self.users_roles
    ur.each do |u|
      if u.created_at == nil then
        u.created_at = DateTime.now
        u.created_by_id = self.id
      end

    end
    self.save
  end


  blogs #added for blogit

  def full_name
    first_name + ' ' + last_name
  end

  def username
    profile_name
  end

  def login_required2


  end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}?d=mm"
  end

  def from_omniauth

  end


  extend FriendlyId
  friendly_id :profile_name

end
