class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  after_save :likes_updater
  after_destroy :likes_updater

  def likes_updater
    post.update(likes_counter: post.likes.count)
  end
end
