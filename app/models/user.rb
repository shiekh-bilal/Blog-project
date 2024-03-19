class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  rolify
  #enum role: { guest: 0, admin: 1 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
         has_many :articles
  
  #after_create :assign_default_role


  def assign_default_role
    self.add_role(:visitor) if self.roles.blank?

    # role_id = self.role_ids[1] 
    # role = Role.find(role_id)
    # self.add_role(role.name)
  end

  def admin?
    self.has_role?(:admin)
  end
end
