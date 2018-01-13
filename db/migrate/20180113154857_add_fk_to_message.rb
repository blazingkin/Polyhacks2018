class AddFkToMessage < ActiveRecord::Migration[5.0]
  def change
    change_table :chat_messages do |t|
      t.integer :recipient_fk, index: true
    end
  end
end
