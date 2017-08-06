class CreateCycle < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :chore_id
      t.integer :user_id
    end
  end
end
