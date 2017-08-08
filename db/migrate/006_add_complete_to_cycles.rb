class AddCompleteToCycles < ActiveRecord::Migration
  def change
    add_column :cycles, :complete, :boolean, default: false
  end
end
