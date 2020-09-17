class CreateFirebaseTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :firebase_tokens do |t|
      t.string :token
      t.datetime :invalidated_at
      t.references :user, null: false, foreign_key: true
    end
  end
end
