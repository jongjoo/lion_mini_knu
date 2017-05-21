class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string "content"
      t.string "writer"
      
      
      t.timestamps null: false
    end
  end
end
