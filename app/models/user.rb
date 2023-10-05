class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'Author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'users_id'
  has_many :likes, class_name: 'Like', foreign_key: 'users_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def post_recent
    posts.order(created_at: :desc).limit(3)
  end
end
