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
  attr_accessible :homepage, :provider, :uid, :profile_image
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

  def self.fromxxx_omniauth(auth, authprovider)


    where(auth.slice(:provider, :uid)).first_or_create do |user|
      #user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

      if authprovider == "facebook" then
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.profile_name = auth.info.nickname
      end

      if authprovider == "twitter" then
        user.profile_name = auth.info.nickname
        fullname = auth.info.name.split(' ')
        user.first_name = fullname[0]
        user.last_name = fullname[fullname.length - 1]
      end


      #user.image = auth.info.image
    end
  end

  def self.newxxx_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.first_name = data["first_name"] if user.first_name.blank?
        user.last_name = data["last_name"] if user.last_name.blank?
        user.profile_name = data["username"] if user.profile_name.blank?
      end
      if data = session["devise.twitter_data"] && session["devise.twitter_data"]["info"]
        user.profile_name = data["nickname"] if user.profile_name.blank?
        fullname = data["name"].split(' ')
        user.first_name = fullname[0]
        user.last_name = fullname[fullname.length - 1]
      end
    end
  end

  # Facebook Settings
  def self.find_for_oauth(auth,authprovider, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else


      if authprovider == "facebook"
        fbuser = User.where(email: auth.info.email).first
        if fbuser.present?
          logger.info 'in it'
          user = fbuser
          user

        else

          user = User.new(first_name:auth.extra.raw_info.first_name,
                             last_name:auth.extra.raw_info.last_name,
                             homepage:auth.extra.raw_info.link,
                             provider:auth.provider,
                             uid:auth.uid,
                             email:auth.info.email,
                             password:Devise.friendly_token[0,20],
                             profile_name:auth.info.nickname,
                             profile_image:auth.info.image)
          user.skip_confirmation!
          user.save!
          user
        end
      end

      if authprovider == "twitter"

        fullname = auth.info.name.split(' ')
        newfirst_name = fullname[0]
        newlast_name = fullname[fullname.length - 1]
        if newlast_name == newfirst_name
          newlast_name = ""
        end
        twittermail = "#{auth.info.nickname}@twitter.com"


        user = User.new(first_name:newfirst_name,
                           last_name:newlast_name,
                           homepage:auth.info.urls.Twitter,
                           provider:auth.provider,
                           uid:auth.uid,
                           email: twittermail,
                           password:Devise.friendly_token[0,20],
                           profile_name:auth.info.nickname,
                           profile_image:auth.extra.raw_info.profile_image_url)

        user.skip_confirmation!
        user.save!
        user
      end


    end
  end

  def skip_confirmation!
    self.confirmed_at = Time.now
  end


  extend FriendlyId
  friendly_id :profile_name

end
