class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean  :vote_value, null: false
      t.references :user_id, null: false
      t.string   :votable_type, null: false
      t.integer  :votable_id, null: false

      t.timestamps null: false
    end
  end
end
