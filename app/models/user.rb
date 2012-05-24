class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, :phone, :about, :role_id, :organization, :internal

  scope :only_internal, where(:internal => true)


  def admin?
    if self.role_id == 0 || self.id == 1
      return true
    else
      return false
    end
  end

  def manager?
    if self.role_id == 1 || self.role_id == 0
      return true
    else
      return false
    end
  end

  def rentor?
    if self.role_id == 2
      return true
    else
      return false
    end
  end

end
