class User < ActiveRecord::Base
  has_one :address, dependent: :destroy
  has_many :interest, dependent: :destroy
  has_one :bio, dependent: :destroy 
end
