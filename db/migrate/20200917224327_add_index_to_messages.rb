class AddIndexToMessages < ActiveRecord::Migration[6.0]
  def change
    add_index :messages, :body, opclass: :gin_trgm_ops, using: :gin
  end
end
