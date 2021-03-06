class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :vehicles
       
  def user_approved?
    self.approved = true
  end
  
  def active_for_authentication? 
    super && approved? 
  end 
end
