class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :bios, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
  
end
