class User < ActiveRecord::Base
  has_one :address, dependent: :destroy
  has_many :interest, dependent: :destroy
  has_one :bios, dependent: :destroy 
end
