class Comment < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "Author_id"
    belongs_to :post
end
