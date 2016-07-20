class User < ActiveRecord::Base
  has_many :votes
  has_many :posts
  has_many :replies
end
