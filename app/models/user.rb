class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow", dependent: :destroy
  has_many :followers, through: :follower_follows, source: :follower

  has_many :follows, foreign_key: :follower_id
  has_many :followees, through: :follows, source: :followee

  has_many :posts, inverse_of: "author", dependent: :destroy

  has_many :likes, foreign_key: :liker_id, dependent: :destroy
  has_many :liked_posts, through: :likes

  has_many :comments, inverse_of: "commenter", dependent: :destroy

  has_one :profile, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
