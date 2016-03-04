class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :interest, dependent: :destroy
  has_many :bios, dependent: :destroy 
end
