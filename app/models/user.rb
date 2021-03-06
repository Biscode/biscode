class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  
  mount_uploader :image, ImageUploader

  def self.user_name(user_id)
    user = User.find(user_id)
    if user.name
      user.name
    else
      "NA"
    end
  end


 def self.user_signature(user_id)
    user = User.find(user_id)
    if user.signature
      user.signature
    else
      "NA"
    end
  end

  end
