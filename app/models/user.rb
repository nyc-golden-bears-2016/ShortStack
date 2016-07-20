class User < ActiveRecord::Base
  has_many :votes
  has_many :posts
  has_many :replies

  has_secure_password

end