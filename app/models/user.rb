class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :password_confirmation, :remember_me, :name, :surname, :phone, :about, :role_id, :organization, :internal

  scope :only_internal, where(:internal => true)
  scope :agents, where("role_id = ?", 2)

  has_attached_file :avatar,
                    :styles => {
                        :list => '89x89#',
                        :preview => '136x98#'
                    },
                    :default_url => '/user_images/default.jpg',
                    :url => '/user_images/:id/:style_:basename.:extension'


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

  def rieltor?
    if self.role_id == 2 || self.role_id == 1 || self.role_id == 0
      return true
    else
      return false
    end
  end

  def client?
    if self.role_id == 3
      return true
    else
      return false
    end
  end

end
