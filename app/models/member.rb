class Member < ApplicationRecord
  has_many :ideas
  has_many :contests
  acts_as_voter
  has_many :comments
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  enum   role: {citzen:0,provider:1,city_hall:2}
  
  validates :name, :district, :birthday, :role, presence:true

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize do |member|
         member.email = auth.info.email
         member.name = auth.info.name
         member.password = Devise.friendly_token[0,20]
         member.image = auth.info.image
      end
  end


  def self.omniauth_registration(auth) 
      new(provider: auth[:provider], uid: auth[:uid],
         email: auth[:info][:email],
         name: auth[:info][:name],
         image: auth[:info][:image])
  end

  def isCitzen?
     self.role == 'citzen'? true : false
  end
end
