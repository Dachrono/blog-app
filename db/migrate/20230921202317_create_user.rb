class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|

      t.string :name, null: false
      t.string :photo
      t.text :bio
      t.integer :posts_counter, default: 0

      t.timestamps
      
    end
  end
end
