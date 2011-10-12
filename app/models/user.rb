class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :username, :name

  validates_presence_of :username, :on => :update
  validates_uniqueness_of :username
  validates_format_of :username, :with => /^[a-zA-Z0-9_]*$/i

  has_one :information

  after_create :add_new_information_for_user

  private

  def add_new_information_for_user
    create_information
  end
end
