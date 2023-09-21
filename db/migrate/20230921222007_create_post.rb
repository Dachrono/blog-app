class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|

      t.references :author_id, null: false, foreign_key: { to_table: :user }
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0

      t.timestamps
      
    end
  end
end
