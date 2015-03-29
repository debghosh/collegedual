class CreateFacebookAccessTokens < ActiveRecord::Migration
  def change
    create_table :facebook_access_tokens do |t|
      t.string :access_token
      t.integer :user_id

      t.timestamps
    end
  end
end
