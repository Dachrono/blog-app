class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  after_save :comments_updater
  after_destroy :comments_updater

  def comments_updater
    post.update(comments_counter: post.comments.count)
  end
end
