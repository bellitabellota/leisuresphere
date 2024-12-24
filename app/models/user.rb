require "digest"
require "uri"

class User < ApplicationRecord
  after_create :create_profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow", dependent: :destroy
  has_many :followers, through: :follower_follows, source: :follower

  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :followees, through: :follows, source: :followee

  has_many :posts, inverse_of: "author", dependent: :destroy

  has_many :likes, foreign_key: :liker_id, dependent: :destroy
  has_many :liked_posts, through: :likes

  has_many :comments, inverse_of: "commenter", dependent: :destroy

  has_one :profile, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.instance_variable_set(:@avatar_url, auth.info.image)
    end
  end

  private

  def create_profile
    avatar_url = @avatar_url || get_avatar_url
    @profile = self.build_profile(avatar_url: avatar_url)
    @profile.save
  end

  def get_avatar_url
    email_address = self.email.downcase
    hash = Digest::SHA256.hexdigest(email_address)
    size= 200

    params = URI.encode_www_form("s" => size)
    "https://www.gravatar.com/avatar/#{hash}?#{params}"
  end
end
