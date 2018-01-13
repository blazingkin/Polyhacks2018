class AddPropertiesToParents < ActiveRecord::Migration[5.0]
  def change
    change_table :parents do |t|
      t.string :name, index: true
      t.string :email
      t.string :phone_number
      t.float :latitude
      t.float :longitude
    end
    change_table :children do |t|
      t.belongs_to :parent, index: true
      t.string :name
      t.integer :age
    end
  end
end
