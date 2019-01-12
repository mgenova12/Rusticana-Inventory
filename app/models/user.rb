class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable


  ROLES = [:admin, :dover, :trappe, :cambridge, :bypass]
  enum role: ROLES         
  
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    # self.role ||= :user
  end
  
end
