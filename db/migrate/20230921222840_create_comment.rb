class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :users, null: false, foreign_key: true
      t.references :posts, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
