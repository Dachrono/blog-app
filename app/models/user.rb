class User < ApplicationRecord
  has_many :posts, foreign_key: "Author_id"
  has_many :comments, foreign_key: "Author_id"
  has_many :likes
end
