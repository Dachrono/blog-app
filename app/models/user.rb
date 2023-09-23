class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'Author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'users_id'
  has_many :likes, class_name: 'Like', foreign_key: 'users_id'

  def post_recent
    posts.order(created_at: :desc).limit(3)
  end
end
