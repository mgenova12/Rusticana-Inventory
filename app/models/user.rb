class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, uniqueness: true
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  attr_writer :login

  devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable, authentication_keys: [:login]


  ROLES = [:super_admin, :admin, :trappe, :cambridge, :easton_bypass, :dover_rd]
  enum role: ROLES         
  
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    # self.role ||= :user
  end


  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
