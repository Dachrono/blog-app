class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|

      t.references :users, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :text

      t.timestamps
      
    end
  end
end
