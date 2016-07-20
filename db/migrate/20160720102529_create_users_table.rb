class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :email, unique: true
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
