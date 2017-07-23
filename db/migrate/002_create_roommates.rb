class CreateRoommates < ActiveRecord::Migration[4.2]
  def up
  create_table :roommates do |t|
      t.string :username
      t.string :email
      t.string :password_digest
  end
end

def down
  drop_table :roommates
end
end
