class AddOauthToParents < ActiveRecord::Migration[5.0]
  def change
    change_table :parents do |t|
      t.integer :uid
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at
    end
  end
end
