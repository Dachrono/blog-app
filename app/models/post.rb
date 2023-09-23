class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'Author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'posts_id'
  has_many :likes, class_name: 'Like', foreign_key: 'posts_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :post_updater
  after_destroy :post_updater

  def post_updater
    author.update(posts_counter: author.posts.count)
  end

  def comments_recent
    comments.order(created_at: :desc).limit(5)
  end
end
