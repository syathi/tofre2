class User < ActiveRecord::Base
  has_many :follows_from, class_name: Follow, foreign_key: :from_user_id, dependent: :destroy
  has_many :follows_to,   class_name: Follow, foreign_key: :to_user_id,   dependent: :destroy
  has_many :following, through: :follows_from, source: :to_user
  has_many :followed,  through: :follows_to,   source: :from_user

  has_many :refrigerators
  has_many :donuts
  has_many :fabs
  has_many :replies
  has_many :lists



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :authentication_keys => [:login]
  attr_accessor :login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  # 指定ユーザをフォローしているかどうかを返す
  def following?(user)
    self.following.where(id: user.id).any?
  end

  # 指定ユーザにフォローされているかどうかを返す
  def followed_by?(user)
    self.followed.where(id: user.id).any?
  end

end