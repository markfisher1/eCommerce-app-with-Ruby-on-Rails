class User < ApplicationRecord
  # give perms to write on login param
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  # validates username wihtou being case sensitive
  validates :username, presence: :true, uniqueness: {case_sensitive: false}
  # Only allow letter, number, underscore and punctuation.
  # we need to avoid that users use email as username.
  # otherwise it will find 2 results for the same user.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def login
    # accepts 'login' var as username or email.
    # whatever it gets as input.
    @login || self.username || self.email
  end


  # we are using default login keys authentication.
  # allowing users to login with username or email through the defined parameter ':login'
  # therefore we need to make ure that the query makes sense!
  # The following method override will fix the SQL query.

  # if i was working with noSql this wont work, there is another fix.
  # check devise github for more info >

  # > https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
  
  def self.find_for_database_authentication warden_conditions
  conditions = warden_conditions.dup
  login = conditions.delete(:login)
  where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
end
end
