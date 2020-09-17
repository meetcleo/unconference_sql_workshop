class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :snooze_until
  end
end
