class CreateRepliesTable < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string   :response, null: false
      t.references :post, null: false
      t.references :user, null: false

      t.timestamps null: false
  end
end
