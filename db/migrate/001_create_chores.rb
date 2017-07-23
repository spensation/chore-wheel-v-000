class CreateChores < ActiveRecord::Migration[4.2]
  def change
    create_table :chores do |t|
      t.string :name
      t.string :area
      t.string :description
    end
  end
end
