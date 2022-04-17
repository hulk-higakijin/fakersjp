class User < ApplicationRecord
  UID_RANGE = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  generate_public_uid generator: PublicUid::Generators::RangeString.new(20, UID_RANGE)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :name, length: { maximum: 15 }, presence: true
  validates :email, presence: true, uniqueness: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :public_uid, format: { with: VALID_PASSWORD_REGEX, allow_nil: true }, length: { maximum: 20 }, uniqueness: true
end
