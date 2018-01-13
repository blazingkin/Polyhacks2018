class AddPropertiesToNewModels < ActiveRecord::Migration[5.0]
  def change
    change_table :chat_messages do |t|
      t.belongs_to :parent, index: true
      t.foreign_key :parents, name: 'recipient_id', index: true
      t.text :message
    end
    change_table :job_listings do |t|
      t.belongs_to :parent
      t.text :info
    end
    change_table :parents do |t|
      t.text :bio
    end
    change_table :children do |t|
      t.text :bio
      t.belongs_to :job_listing
    end
  end
end
