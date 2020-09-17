class AddIndexToFirebaseTokens < ActiveRecord::Migration[6.0]
  def change
    add_index :firebase_tokens, :invalidated_at
  end
end
