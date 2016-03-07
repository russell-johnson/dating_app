class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :bios, dependent: :destroy
  validates_uniqueness_of :email
  validates_presence_of :email, :password_digest
  has_secure_password

  mount_uploader :avatar, AvatarUploader

end
