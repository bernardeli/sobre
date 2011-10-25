class User
  include Mongoid::Document

  field :username, :type => String
  field :name, :type => String

  embeds_one :page

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :username, :name

  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false
  validates_format_of :username, :with => /^[a-zA-Z0-9_]*$/i

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  after_create :create_page
  after_create :send_welcome_email

  def theme
    "theme-" + page.theme
  end

  private

  def send_welcome_email
    ContactMailer.welcome_email(self).deliver
  end
end
