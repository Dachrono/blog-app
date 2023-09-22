class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'Author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'posts_id'
  has_many :likes, class_name: 'Like', foreign_key: 'posts_id'

  after_save :post_updater
  after_destroy :post_updater

  def post_updater
    author.update(posts_counter: author.posts.count)
  end

  def comments_recent
    comments.order(created_at: :desc).limit(5)
  end
end
