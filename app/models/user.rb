class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationship",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :nickname, presence: true, length: 5..15, uniqueness: true, format: { without: /[!-\/\@\^\~\`\(\)\[\]\>\<\=]/ }

  mount_uploader :avatar, AvatarUploader

  attr_writer :login

  def login
    @login || self.nickname || self.email
  end

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  def self.search(term)
    if term
      where('nickname LIKE ?', "%#{term}%")
    else
      nil
    end
  end

  def feed
    r = Relationship.arel_table
    t = Photo.arel_table
    sub_query = t[:user_id].in(r.where(r[:follower_id].eq(id)).project(r[:followed_id]))
    Photo.where(sub_query.or(t[:user_id].eq(id)))
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
end
