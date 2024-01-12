class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :username, null: false
      t.string :auth, null: false
      t.string :email, null: false
      t.index :email, unique: true
      t.index :username, unique: true
      t.check_constraint("email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'", name: "proper_email")
      t.check_constraint("username ~ '^[a-z0-9]*$'", name: "proper_username")
      t.check_constraint("auth = 'administrator' OR auth = 'client'", name: "proper_auth") # starting w client/administrator
      t.timestamps
    end
  end
end
