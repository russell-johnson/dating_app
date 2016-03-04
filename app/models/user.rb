class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :interest, dependent: :destroy
<<<<<<< HEAD
  has_many :bios, dependent: :destroy 
=======
  has_one :bios, dependent: :destroy
>>>>>>> 0e02083f005dbac87cca7ebc1e8d489aa447d02d
end
