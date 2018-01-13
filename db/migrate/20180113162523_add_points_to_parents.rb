class AddPointsToParents < ActiveRecord::Migration[5.0]
  def change
    change_table :parents do |t|
      t.integer :points
    end
  end
end
