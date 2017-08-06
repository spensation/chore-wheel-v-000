class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :title
    end
  end
end
