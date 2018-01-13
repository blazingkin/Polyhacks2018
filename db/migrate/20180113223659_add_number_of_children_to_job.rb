class AddNumberOfChildrenToJob < ActiveRecord::Migration[5.0]
  def change
    change_table :job_listings do |t|
      t.integer :child_number
    end
  end
end
