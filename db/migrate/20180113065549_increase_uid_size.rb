class IncreaseUidSize < ActiveRecord::Migration[5.0]
  def change
    change_column :parents, :uid, :integer, limit: 8
  end
end
