class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title, null: false
      t.string   :content, null: false
      t.integer  :best_answer
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
